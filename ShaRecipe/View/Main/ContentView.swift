//
//  ContentView.swift
//  ShaRecipe
//
//  Created by Mike on 12/5/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeController())
    }
}
