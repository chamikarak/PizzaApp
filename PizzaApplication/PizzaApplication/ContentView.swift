//
//  ContentView.swift
//  PizzaApplication
//
//  Created by Chamikara on 2023-03-01.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PizzaViewModel()
    
    var body: some View {
        TabView {
            PizzaList(viewModel: viewModel)
                .tabItem {
                    Label("Pizza List", systemImage: "list.dash")
                }
            FavPizzaList(viewModel: viewModel)
                .tabItem {
                    Label("Favourites", systemImage: "star.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
