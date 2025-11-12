//
//  ForumModel.swift
//  MyPaw
//
//  Created by Larderet on 12/11/2025.
//

import SwiftUI

// Modèle pour un guide/article
struct GuideItem: Identifiable, @unchecked Sendable {
    let id: Int
    let title: String
    let type: String
    let isBanner: Bool
    let description: String
    let backgroundImage: String
    let overlayColor: Color
    let buttonColor: Color
    
    // Contenu détaillé du guide
    let sections: [GuideSection]
    let author: String
    let readingTime: String
    let coverImage: String
    
    init(id: Int,
         title: String,
         type: String,
         isBanner: Bool = false,
         description: String,
         backgroundImage: String = "",
         overlayColor: Color = .clear,
         buttonColor: Color = .darkBrown,
         sections: [GuideSection] = [],
         author: String = "Équipe MyPaw",
         readingTime: String = "5 min",
         coverImage: String = "") {
        self.id = id
        self.title = title
        self.type = type
        self.isBanner = isBanner
        self.description = description
        self.backgroundImage = backgroundImage
        self.overlayColor = overlayColor
        self.buttonColor = buttonColor
        self.sections = sections
        self.author = author
        self.readingTime = readingTime
        self.coverImage = coverImage
    }
}

// Modèle pour une section de contenu
struct GuideSection: Identifiable, @unchecked Sendable {
    let id = UUID()
    let type: SectionType
    let content: String
    let imageUrl: String?
    
    enum SectionType: Sendable {
        case heading
        case paragraph
        case bulletList
        case tip
        case warning
        case image
    }
    
    init(type: SectionType, content: String, imageUrl: String? = nil) {
        self.type = type
        self.content = content
        self.imageUrl = imageUrl
    }
}
