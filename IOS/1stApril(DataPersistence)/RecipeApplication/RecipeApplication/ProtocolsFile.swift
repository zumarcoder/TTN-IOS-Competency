//
//  ProtocolsFile.swift
//  RecipeApplication
//
//  Created by Akash Verma on 04/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit
import CoreData

class ProtocolsFile
{
    let favoriteValue = true
    fileprivate lazy var fetchedResultController1: NSFetchedResultsController<Recipe> = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        //        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        fetchRequest.predicate = NSPredicate(format: "favorite == true")
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self as? NSFetchedResultsControllerDelegate
        try! fetchResultController.performFetch()
        return fetchResultController
    }()
}

protocol SavingDataToDB
{
    //declaration
    func addData(name : String , origin : String , favorite : Bool , timeToPrep : String , madeBy : String , ingrediant : String)
}

extension SavingDataToDB
{
    // defination of addData and saves the data in Database
    func addData(name : String , origin : String , favorite : Bool , timeToPrep : String , madeBy : String , ingrediant : String)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)
        let recipeObject = NSManagedObject(entity: entity!, insertInto: context)
        recipeObject.setValue(name, forKey: "name")
        recipeObject.setValue(origin, forKey: "origin")
        recipeObject.setValue(favorite, forKey: "favorite")
        recipeObject.setValue(timeToPrep, forKey: "time")
        recipeObject.setValue(madeBy, forKey: "madeBy")
        recipeObject.setValue(ingrediant, forKey: "ingrediants")
        do
        {
            try context.save()
        }catch let error as NSError
        {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}
