//
//  PizzaViewModel.swift
//  PizzaApplication
//
//  Created by Chamikara on 2023-03-10.
//

import Foundation
import CoreData

class PizzaViewModel: ObservableObject {
    
    @Published var savedPizzaData: [PizzaEntity] = []
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "PizzaDataContainer")
        container.loadPersistentStores {description, error in
            if let error = error{
                print("error in loading data \(error)")
            } else {
                print("Successfully loaded core data.")
            }
        }
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<PizzaEntity>(entityName: "PizzaEntity")
        do {
            savedPizzaData = try container.viewContext.fetch(request)
        } catch let error {
            print("Error in fetching data \(error)")
        }
    }
    
    func addPizzaData(name: String, ingredients: String, imageName: String, pizzaType: String, isFavourite: Bool) {
        let newPizza = PizzaEntity(context: container.viewContext)
        newPizza.name = name
        newPizza.ingredients = ingredients
        newPizza.imageName = imageName
        newPizza.pizzaType = pizzaType
        newPizza.isFavourite = isFavourite
        
        saveData()
    }
    
    func saveData() {
        do{
            try container.viewContext.save()
            fetchData()
        } catch let error {
            print("Error while saving data \(error)")
        }
    }
    
    func filterPizzaWithType(pizzaType :  String) -> [PizzaEntity]  {
       return savedPizzaData.filter { $0.pizzaType == pizzaType }
    }
    
    func updateIsFavourite(selectedPizza: PizzaEntity, isFavourite: Bool) {
        selectedPizza.isFavourite = isFavourite
        saveData()
    }
    
    func filterFavouritePizza() -> [PizzaEntity] {
        return savedPizzaData.filter{ $0.isFavourite == true }
    }
}
