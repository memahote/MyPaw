//
//  ForumComponent.swift
//  MyPaw
//
//  Created by Larderet on 12/11/2025.
//

import SwiftUI

// MARK: - Composant pour la bannière mise en avant
struct BannerCard: View {
    let guide: GuideItem
    @State private var headTilt: CGFloat = 0
    @State private var bobUp: Bool = false
    
    var body: some View {
        NavigationLink(destination: GuideDetailView(guide: guide)) {
            HStack {
//                Image("kiki")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(height: 130)
//                    .rotationEffect(.degrees(360))
//                    .cornerRadius(12)
//                    .padding(.trailing, 10)
                
                ZStack {
                    // Corps du chat
                    Image("kikiBody")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(y: 10)

                    // Tête du chat
                    Image("kikiGrumpy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .offset(x: -20, y: -50) // ajustement
                        .rotationEffect(.degrees(headTilt))
                        .animation(
                            .easeInOut(duration: 1.5)
                                .repeatForever(autoreverses: true),
                            value: headTilt
                        )
                        .onAppear {
                            headTilt = 5 // angle de rotation
                        }
                }
                .frame(width: 100, height: 150)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(guide.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding([.bottom, .top], 6)
                    
                    Text(guide.description)
                        .font(.custom("SF Pro", size: 14))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .padding(.bottom, 10)
                    
                    Text("LIRE L'ARTICLE")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .frame(width: 148, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 10).foregroundStyle(.darkBrown)
                        )
                }
                .frame(height: 160)
            }
            .padding(16)
            .background(Color.orangeMid)
            .cornerRadius(25)
        }
    }
}

// MARK: - Composant pour un bouton de filtre
struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .fontWeight(isSelected ? .bold : .regular)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(isSelected ? Color.orangeMid : Color.orangeMid.opacity(0.2))
                .cornerRadius(25)
        }
    }
}

// MARK: - Composant pour une carte de guide dans la grille
struct GuideCard: View {
    let guide: GuideItem
    
    var body: some View {
        NavigationLink(destination: GuideDetailView(guide: guide)) {
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                
                // Titre du guide
                Text(guide.title)
                    .font(.custom("Instrument Sans", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                // Description du guide
                Text(guide.description)
                    .font(.custom("SF Pro", size: 12))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.bottom, 10)
                
                // Bouton GO
                Text("GO")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(width: 49, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 10).foregroundStyle(guide.buttonColor)
                    )
            }
            .padding([.horizontal, .vertical], 10)
            .padding(9)
            .frame(height: 200)
            .background(
                ZStack {
                    Image(guide.backgroundImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    guide.overlayColor
                }
            )
            .cornerRadius(20)
            .clipped()
        }
    }
}

// MARK: - Composant pour une section de contenu
struct GuideSectionView: View {
    let section: GuideSection
    
    var body: some View {
        switch section.type {
        case .heading:
            Text(section.content)
                .font(.custom("Instrument Sans", size: 24))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 24)
                .padding(.bottom, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        case .paragraph:
            Text(section.content)
                .font(.custom("SF Pro", size: 16))
                .foregroundColor(.black)
                .lineSpacing(6)
                .padding(.bottom, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        case .bulletList:
            Text(section.content)
                .font(.custom("SF Pro", size: 16))
                .foregroundColor(.black)
                .lineSpacing(8)
                .padding(.bottom, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        case .tip:
            HStack(alignment: .top, spacing: 12) {
                Text(section.content)
                    .font(.custom("SF Pro", size: 15))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(16)
            .background(Color.orangeMid.opacity(0.2))
            .cornerRadius(12)
            .padding(.vertical, 8)
            
        case .warning:
            HStack(alignment: .top, spacing: 12) {
                Text(section.content)
                    .font(.custom("SF Pro", size: 15))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(16)
            .background(Color.red.opacity(0.1))
            .cornerRadius(12)
            .padding(.vertical, 8)
            
        case .image:
            if let imageName = section.imageUrl {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                    .padding(.vertical, 12)
            }
        }
    }
}
