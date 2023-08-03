//
//  AddNewPizza.swift
//  PizzaApplication
//
//  Created by Chamikara on 2023-03-01.
//

import SwiftUI

struct AddNewPizza: View {
    
    @ObservedObject var viewModel: PizzaViewModel
    
    @State private var pizzaName = ""
    @State private var ingredients = ""
    @State private var imageName = ""
    @State private var pizzaType = ""
    @State private var isFavourite = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Name", text: $pizzaName)
                } header: {
                    Text("Pizza Name")
                }
                
                Section {
                    TextEditor(text: $ingredients)
                        .frame(height: 250.0)
                } header: {
                    Text("Ingredients")
                }
                
                Section {
                    TextField("Image Name", text: $imageName)
                } header: {
                    Text("Image Details")
                }

                Section {
                    TextField("Type", text: $pizzaType)
                } header: {
                    Text("Pizza Type")
                }

                Section {
                    Toggle("Favourite", isOn: $isFavourite)
                }

            }
            
            .navigationTitle("New Pizza")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            viewModel.addPizzaData(name: pizzaName, ingredients: ingredients, imageName: imageName, pizzaType: pizzaType, isFavourite: isFavourite)
                            
                            dismiss()
                        }
                    }
                }
        }
        
    }
}

struct AddNewPizza_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPizza(viewModel: PizzaViewModel())
    }
}
