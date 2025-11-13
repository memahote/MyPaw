import SwiftUI

struct ForumsView: View {
    @State private var viewModel = ForumViewModel()
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    // Titre de la page
                    Text("Guide pratique")
                        .font(.custom("Instrument Sans", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                    
                    // ScrollView Horizontal Filtres
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            Spacer()
                                .frame(width: 4)
                            
                            // Affichage des filtres avec composant
                            ForEach(viewModel.filters, id: \.self) { filter in
                                FilterButton(
                                    title: filter,
                                    isSelected: viewModel.selectedFilter == filter
                                ) {
                                    viewModel.selectedFilter = filter
                                }
                            }
                            .padding(.bottom, 5)
                            
                            Spacer()
                                .frame(width: 6)
                        }
                    }
                    
                    // Bannière mise en avant avec composant
                    BannerCard(guide: viewModel.banniereItem)
                        .padding(.horizontal, 16)
                    
                    // Grille de guides avec composants
                    VStack(alignment: .leading) {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 14), GridItem(.flexible())], spacing: 14) {
                            ForEach(viewModel.filteredGuides) { guide in
                                GuideCard(guide: guide)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .background(Color("whiteDirt"))
        }
        .background(Color("whiteDirt"))
    }
}

// MARK: - Vue détail complète
struct GuideDetailView: View {
    let guide: GuideItem
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Image de couverture
                if !guide.coverImage.isEmpty {
                    ZStack(alignment: .topLeading) {
                        Image(guide.coverImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipped()
                        
                        // Overlay gradient pour meilleure lisibilité
                        LinearGradient(
                            gradient: Gradient(colors: [.black.opacity(0.3), .clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 100)
                    }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    // Métadonnées (auteur, temps de lecture, type)
                    HStack(spacing: 12) {
                        // Photo de profil de l'auteur (placeholder)
                        Circle()
                            .fill(Color.orangeMid.opacity(0.3))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text(String(guide.author.prefix(1)))
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.darkBrown)
                            )
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(guide.author)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
                            
                            HStack(spacing: 8) {
                                Text(guide.readingTime)
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                Text("•")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                
                                // Badge type
                                Text(guide.type)
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(guide.buttonColor)
                                    .cornerRadius(8)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    Divider()
                        .padding(.vertical, 8)
                    
                    // Contenu des sections
                    ForEach(guide.sections) { section in
                        GuideSectionView(section: section)
                    }
                    
                    // Espacer après le dernier contenu
                    Spacer()
                        .frame(height: 20)
                    
                    // Footer avec call-to-action
                    VStack(spacing: 16) {
                        Divider()
                        
                        Text("Cet article vous a été utile ?")
                            .font(.custom("Instrument Sans", size: 18))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        HStack(spacing: 12) {
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "hand.thumbsup.fill")
                                    Text("Oui")
                                }
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                                .background(Color.orangeMid)
                                .cornerRadius(12)
                            }
                            
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "hand.thumbsdown")
                                    Text("Non")
                                }
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(12)
                            }
                        }
                        
                        // Partage
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Partager cet article")
                            }
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.darkBrown)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.orangeMid.opacity(0.2))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .background(Color("whiteDirt"))
        .navigationTitle(guide.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ForumsView()
}
