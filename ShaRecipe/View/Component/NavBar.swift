//
//  NavBar.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        TabView {
            CuratedRecipeView()
                .tabItem {
                    Label("Curated", systemImage: "house")
                }
            AddRecipeView()
                .tabItem {
                    Label("Add Recipe", systemImage: "plus")
                }
            ShareableRecipeView()
                .tabItem {
                    Label("Shareable", systemImage: "personalhotspot")
                }
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
