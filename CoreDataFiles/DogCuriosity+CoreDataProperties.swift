//
//  DogCuriosity+CoreDataProperties.swift
//  Core Data App
//
//  Created by lucas meireles on 02/01/23.
//
//

import Foundation
import CoreData


extension DogCuriosity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DogCuriosity> {
        return NSFetchRequest<DogCuriosity>(entityName: "DogCuriosity")
    }

    @NSManaged public var curiosity: String?
    @NSManaged public var dog: Dog?

}

extension DogCuriosity : Identifiable {

}
