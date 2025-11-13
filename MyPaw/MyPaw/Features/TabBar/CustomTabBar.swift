//
//  CustomTabBar.swift
//  MyPaw
//
//  Created by Larderet on 13/11/2025.
//

import SwiftUI

// MARK: - Tab Item Enum
enum TabItem: Int, CaseIterable {
    case profil = 0
    case scanner = 1
    case calendar = 2
    case forum = 3
    
    var iconName: String {
        switch self {
        case .profil: return "profilTab"
        case .scanner: return "scannerTab"
        case .calendar: return "calendarTab"
        case .forum: return "forumTab"
        }
    }
    
    var title: String {
        switch self {
        case .profil: return "Profil"
        case .scanner: return "Scanner"
        case .calendar: return "Planning"
        case .forum: return "Forum"
        }
    }
}

// MARK: - Custom Tab Bar View
struct CustomTabBar: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabItem.allCases, id: \.self) { tab in
                TabBarButton(
                    tab: tab,
                    isSelected: selectedTab == tab,
                    action: {
                        selectedTab = tab
                    }
                )
            }
        }
        .frame(height: 86)
        .background(Color("whiteDirt"))
        .clipShape(
            .rect(
                topLeadingRadius: 20,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 20
            )
        )
        
        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: -5)
        .padding(.bottom, -33)
    }
}

// MARK: - Tab Bar Button
struct TabBarButton: View {
    let tab: TabItem
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(tab.iconName)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? Color("orangeDeep") : .gray)
                
                Text(tab.title)
                    .font(.system(size: 12, weight: isSelected ? .semibold : .regular))
                    .foregroundColor(isSelected ? Color("orangeDeep") : .gray)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Main Tab Container
struct MainTabView: View {
    @State private var selectedTab: TabItem = .profil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Content selon l'onglet sélectionné
            Group {
                switch selectedTab {
                case .profil:
                    ProfilView()
                case .scanner:
                    YukaScannerView()
                case .calendar:
                    CalendarCustomView()
                case .forum:
                    ForumsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // TabBar personnalisée
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    MainTabView()
}
