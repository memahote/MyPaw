////
////  ForumTest.swift
////  MyPaw
////
////  Created by Larderet on 12/11/2025.
////
//
//import SwiftUI
//
//struct ForumsView: View {
//    @State private var selectedFilter = "Tous"
//    
//    private let filters = ["Tous", "Alimentation", "Sevrage", "Jeux"]
//    
//    // Bannière mise en avant
//    private let banniereItem = GuideItem(
//        id: 1,
//        title: "Mon chat bouge-t'il assez ?",
//        type: "Activité",
//        isBanner: true,
//        description: "Activité physique, jeux, exercices... Découvrez les conseils des professionnels du secteur",
//        backgroundImage: "",
//        overlayColor: .clear
//    )
//    
//    // Guides pour la grille
//    private let guides = [
//        GuideItem(
//            id: 2,
//            title: "Vie de Chat",
//            type: "Alimentation",
//            description: "Qu’est-ce que fait votre chat quand vous n’êtes pas là ?.",
//            backgroundImage: "imgforum1",
//            overlayColor: Color.darkBrown.opacity(0.65),
//            buttonColor: .darkBrown
//        ),
//        GuideItem(
//            id: 3,
//            title: "Chat Heureux",
//            type: "Sevrage",
//            description: "Est-ce que votre chat est heureux ? Faites le test.",
//            backgroundImage: "imgForum2",
//            overlayColor: Color.orangeDeep.opacity(0.65),
//            buttonColor: .orangeDeep
//        ),
//        GuideItem(
//            id: 4,
//            title: "Jeux et stimulation",
//            type: "Jeux",
//            description: "Des activités ludiques pour le bien-être de votre animal.",
//            backgroundImage: "imgForum3",
//            overlayColor: Color.orangeMid.opacity(0.65),
//            buttonColor: .orangeMid
//        ),
//        GuideItem(
//            id: 5,
//            title: "Au dodo Annick",
//            type: "Alimentation",
//            description: "Et si le sommeil de votre chat pouvait changer votre vie ? .",
//            backgroundImage: "imgForum4",
//            overlayColor: Color.darkBrown.opacity(0.65),
//            buttonColor: .darkBrown
//        )
//    ]
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 14) {
//                    // Titre de la page
//                    Text("Guide pratique")
//                        .font(.custom("Instrument Sans", size: 30))
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                        .padding(.top, 10)
//                        .padding(.horizontal, 16)
//                        .padding(.bottom, 16)
//                    
//                    // ScrollView Horizontal Filtres
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 12) {
//                            Spacer()
//                                .frame(width: 4)
//                            
//                            // Affichage des filtres
//                            ForEach(filters, id: \.self) { filter in
//                                Button(filter) {
//                                    selectedFilter = filter
//                                }
//                                .font(.system(size: 14))
//                                .foregroundColor(.black)
//                                .fontWeight(selectedFilter == filter ? .bold : .regular)
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, 10)
//                                .background(selectedFilter == filter ? Color.orangeMid : Color.orangeMid.opacity(0.2))
//                                .cornerRadius(25)
//                            }
//                            .padding(.bottom, 5)
//                            
//                            Spacer()
//                                .frame(width: 6)
//                        }
//                    }
//                    
//                    // Bannière mise en avant
//                    VStack {
//                        NavigationLink(destination: Text("Détails de l'article")) {
//                            HStack {
//                                Image("kiki")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height: 130)
//                                    .rotationEffect(.degrees(360))
//                                    .cornerRadius(12)
//                                    .padding(.trailing, 10)
//                                
//                                VStack(alignment: .leading, spacing: 8) {
//                                    Text(banniereItem.title)
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.black)
//                                        .multilineTextAlignment(.leading)
//                                        .padding([.bottom, .top], 6)
//                                    
//                                    Text(banniereItem.description)
//                                        .font(.custom("SF Pro", size: 14))
//                                        .foregroundColor(.black)
//                                        .multilineTextAlignment(.leading)
//                                        .lineLimit(3)
//                                        .padding(.bottom, 10)
//                                    
//                                    Text("LIRE L'ARTICLE")
//                                        .font(.system(size: 14))
//                                        .foregroundColor(.white)
//                                        .frame(width: 148, height: 44)
//                                        .background(
//                                            RoundedRectangle(cornerRadius: 10).foregroundStyle(.darkBrown)
//                                        )
//                                }
//                                .frame(height: 160)
//                            }
//                            .padding(16)
//                            .background(Color.orangeMid)
//                            .cornerRadius(25)
//                        }
//                    }
//                    .padding(.horizontal, 16)
//                    
//                    // Grille de guides
//                    VStack(alignment: .leading) {
//                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 14), GridItem(.flexible())], spacing: 14) {
//                            ForEach(filteredGuides) { guide in
//                                NavigationLink(destination: GuideDetailView(guide: guide)) {
//                                    VStack(alignment: .leading, spacing: 8) {
//                                        Spacer()
//                                        
//                                        // Titre du guide
//                                        Text(guide.title)
//                                            .font(.custom("Instrument Sans", size: 18))
//                                            .fontWeight(.bold)
//                                            .foregroundColor(.white)
//                                            .multilineTextAlignment(.leading)
//                                        
//                                        // Description du guide
//                                        Text(guide.description)
//                                            .font(.custom("SF Pro", size: 12))
//                                            .foregroundColor(.white)
//                                            .multilineTextAlignment(.leading)
//                                            .lineLimit(2)
//                                            .padding(.bottom, 10)
//                                        
//                                        // "Bouton" GO
//                                        Text("GO")
//                                            .font(.system(size: 14))
//                                            .foregroundColor(.white)
//                                            .frame(width: 49, height: 44)
//                                            .background(
//                                                RoundedRectangle(cornerRadius: 10).foregroundStyle(guide.buttonColor)
//                                            )
//                                    }
//                                    .padding([.horizontal, .vertical], 10)
//                                    .padding(9)
//                                    .frame(height: 200)
//                                    .background(
//                                        ZStack {
//                                            Image(guide.backgroundImage)
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fill)
//                                            
//                                            guide.overlayColor
//                                        }
//                                    )
//                                    .cornerRadius(20)
//                                    .clipped()
//                                }
//                            }
//                        }
//                    }
//                    .padding(.horizontal, 16)
//                }
//            }
//            .background(Color("whiteDirt"))
//        }
//        .background(Color("whiteDirt"))
//    }
//    
//    // Filtrage des guides
//    private var filteredGuides: [GuideItem] {
//        selectedFilter == "Tous" ? guides : guides.filter { $0.type == selectedFilter }
//    }
//}
//
//// Modèle de données
//struct GuideItem: Identifiable {
//    let id: Int
//    let title: String
//    let type: String
//    let isBanner: Bool
//    let description: String
//    let backgroundImage: String
//    let overlayColor: Color
//    let buttonColor: Color
//    
//    init(id: Int, title: String, type: String, isBanner: Bool = false, description: String, backgroundImage: String = "", overlayColor: Color = .clear, buttonColor: Color = .darkBrown) {
//        self.id = id
//        self.title = title
//        self.type = type
//        self.isBanner = isBanner
//        self.description = description
//        self.backgroundImage = backgroundImage
//        self.overlayColor = overlayColor
//        self.buttonColor = buttonColor
//    }
//}
//
//// Vue détail
//struct GuideDetailView: View {
//    let guide: GuideItem
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 16) {
//                Text("Contenu détaillé du guide à venir...")
//                    .font(.custom("SF Pro", size: 16))
//                    .foregroundColor(.black)
//            }
//            .padding()
//        }
//        .navigationTitle(guide.title)
//        .navigationBarTitleDisplayMode(.large)
//    }
//}
//
//#Preview {
//    ForumsView()
//}
