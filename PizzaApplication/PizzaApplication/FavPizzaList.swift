//
//  FavPizzaList.swift
//  PizzaApplication
//
//  Created by Chamikara on 2023-03-01.
//

import SwiftUI

struct FavPizzaList: View {
    @ObservedObject var viewModel :  PizzaViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filterFavouritePizza()) { pizza in
                    HStack{
                        Image("\(pizza.imageName ?? "")")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text("\(pizza.name ?? "")")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favourite Pizzas")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct FavPizzaList_Previews: PreviewProvider {
    static var previews: some View {
        FavPizzaList(viewModel: PizzaViewModel())
    }
}
