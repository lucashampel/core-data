//
//  ViewController.swift
//  Core Data App
//
//  Created by lucas meireles on 27/12/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var screen:MainView?
    let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = MainView()
        self.view = self.screen
        
        screen?.delegate(delegate: self)
    }
    
    
    func getAllDogs(){
        do {
            print("---Get all dogs----")
            let dogs = try context.fetch(Dog.fetchRequest())
            for dogis in dogs {
                print("Nome: ", dogis.name ?? "")
                screen?.labelTextView.text! += dogis.name!
            }
            print("------------------")

        } catch {
            //test
        }
        
    }
    
    func createDog(){
        let dog = Dog(context: context)
        dog.name = screen?.inputTextView.text
        
        let curiosity = DogCuriosity(context: context)
        curiosity.curiosity = "name 00"
        
        dog.addToDogCuriosity(curiosity)
        do {
            try context.save()
            print("Created dog: ", dog.name!)
        }
        catch {
            //error
        }
    }
    
    func deleteDog(dogInput: Dog){
        context.delete(dogInput)
        do{
            try context.save()
            
        }catch{
            //err
        }
    }
    
    func deleteAllDogs(){
        do{
            let dogs = try context.fetch(Dog.fetchRequest())
            for dog in dogs {
                context.delete(dog)
            }
            try context.save()
            print("----All dogs deleted---")
        }catch{
            //err
        }
    }
    
    func getDogCuriosity(dog:Dog){
        do{
            let request: NSFetchRequest<DogCuriosity> = DogCuriosity.fetchRequest()
            
            request.predicate = NSPredicate(format: "dog = %@", dog)
            
            var fetchedCurisositys: [DogCuriosity] = []
            
            fetchedCurisositys = try context.fetch(request)
            
            print("-------")
            for aux in fetchedCurisositys{
                print(aux.curiosity!)
            }
            
        }
        catch{
            //err
        }
    }
    
    func getCuriosity(){
        do{
            let dog = try context.fetch(Dog.fetchRequest())
            for aux in dog{
                getDogCuriosity(dog: aux)
            }
            
        }catch{
            //err
        }
    }
    
    
}

extension ViewController:ViewControllerDelegate{
    func tappedDeleteDog() {
        deleteAllDogs()
    }
    
    func tappedInsertDog() {
        createDog()
    }
    
    func tappedGetAllDogguinhos() {
        getCuriosity()
    }
    
    
}

