//
//  Dog+CoreDataProperties.swift
//  Core Data App
//
//  Created by lucas meireles on 02/01/23.
//
//

import Foundation
import CoreData


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog")
    }

    @NSManaged public var name: String?
    @NSManaged public var dogCuriosity: NSSet?

}

// MARK: Generated accessors for dogCuriosity
extension Dog {

    @objc(addDogCuriosityObject:)
    @NSManaged public func addToDogCuriosity(_ value: DogCuriosity)

    @objc(removeDogCuriosityObject:)
    @NSManaged public func removeFromDogCuriosity(_ value: DogCuriosity)

    @objc(addDogCuriosity:)
    @NSManaged public func addToDogCuriosity(_ values: NSSet)

    @objc(removeDogCuriosity:)
    @NSManaged public func removeFromDogCuriosity(_ values: NSSet)

}

extension Dog : Identifiable {

}
