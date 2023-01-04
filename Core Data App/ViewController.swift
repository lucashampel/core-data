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
            }
            print("------------------")

        } catch {
            //test
        }
        
    }
    
    func createDog(){
        let dog = Dog(context: context)
        dog.name = screen?.inputTextView.text
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
}

extension ViewController:ViewControllerDelegate{
    func tappedDeleteDog() {
        deleteAllDogs()
    }
    
    func tappedInsertDog() {
        createDog()
    }
    
    func tappedGetAllDogguinhos() {
        getAllDogs()
    }
    
    
}

