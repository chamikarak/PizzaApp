//
//  PizzaList.swift
//  PizzaApplication
//
//  Created by Chamikara on 2023-03-01.
//

import SwiftUI

struct PizzaList: View {
    
    @ObservedObject var viewModel: PizzaViewModel
    
    @State private var isSheetShowing : Bool = false
    @State private var selectedIndex : Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Pizza", selection: $selectedIndex) {
                    Text("All").tag(0)
                    Text("Meat").tag(1)
                    Text("Veggie").tag(3)
                }
                .pickerStyle(.segmented)
                
                List {
                    if selectedIndex == 0 {
                        ForEach(viewModel.savedPizzaData) { pizza in
                            NavigationLink {
                                SinglePizzaView(selectedPizzaItem: pizza, viewModel: viewModel)
                            } label: {
                                HStack{
                                    Image("\(pizza.imageName ?? "")")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    Text("\(pizza.name ?? "")")
                                    
                                    Text("\(pizza.isFavourite.description)")
                                }
                            }
                            
                        }
                    } else if selectedIndex == 1 {
                        ForEach(viewModel.filterPizzaWithType(pizzaType: "meat")) { pizza in
                            HStack{
                                Image("\(pizza.imageName ?? "")")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Text("\(pizza.name ?? "")")
                            }
                        }
                    } else {
                        ForEach(viewModel.filterPizzaWithType(pizzaType: "vegetarian")) { pizza in
                            HStack{
                                Image("\(pizza.imageName ?? "")")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                Text("\(pizza.name ?? "")")
                            }
                        }
                    }
                    
                    
                    
                }
                .listStyle(.plain)
                .navigationTitle("Favourite Pizzas")
                .navigationBarTitleDisplayMode(.large)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                AddNewPizza(viewModel: viewModel)
            }
        }
    }
}

struct PizzaList_Previews: PreviewProvider {
    static var previews: some View {
        PizzaList(viewModel: PizzaViewModel())
    }
}
