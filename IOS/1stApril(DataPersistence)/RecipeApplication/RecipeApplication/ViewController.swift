//
//  ViewController.swift
//  RecipeApplication
//
//  Created by Akash Verma on 02/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController
{

    @IBOutlet weak var allRecipeTableView: UITableView!
    @IBOutlet weak var editRecipeButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    // Fetch the details for core Data
    fileprivate lazy var fetchedResultController: NSFetchedResultsController<Recipe> =
    {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self as? NSFetchedResultsControllerDelegate
        try! fetchResultController.performFetch()
        return fetchResultController
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        allRecipeTableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
    }

    override func viewWillAppear(_ animated: Bool)
    {
         allRecipeTableView.reloadData()
    }
    
    //Presents the View To Store Data in Database
    @IBAction func onEditRecipeButtonClick(_ sender: Any)
    {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "EnteringDetails") as! EnteringDetails
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
}

// Confirms Delegate for Table view
extension ViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (fetchedResultController.fetchedObjects?.count)! // BluePrint of the CoreData
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let recipe1 = fetchedResultController.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = recipe1.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rec1 = fetchedResultController.object(at: indexPath)
        UserDefaults.standard.set(rec1.name, forKey: "abc")
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "UpdateRecipe") as! UpdateRecipe
        self.present(controller, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Deletes Data when swiped Left
        if editingStyle == .delete
        {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            let recipe1 = fetchedResultController.object(at: indexPath)
            context!.delete(recipe1)
            do
            {
                try context!.save()
                print("saved!")
            }
            catch let error as NSError
            {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
}

// FetchedResultControllerDelegate is confirmed so that table get reloaded when any change Happens in the coreData
extension ViewController : NSFetchedResultsControllerDelegate
{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        allRecipeTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        allRecipeTableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    {
        // Deletes the indexpath and deletes then below rows gets up
        if(type == .delete)
        {
            allRecipeTableView.deleteRows(at: [indexPath!] , with: .fade)
            
        }
            
            // this insert the row at same indexPath
        else if(type == .insert)
        {
            let currentIndexPath = self.fetchedResultController.indexPath(forObject: anObject as! Recipe)
            if(currentIndexPath != nil)
            {
                self.allRecipeTableView.insertRows(at: [currentIndexPath!], with: .fade)
            }
        }
            
            //this deletes the row at index then adds the same row for the updation
        else if(type == .update)
        {
            allRecipeTableView.deleteRows(at: [indexPath!] , with: .fade)
            let currentIndexPath = self.fetchedResultController.indexPath(forObject: anObject as! Recipe)
            if(currentIndexPath != nil)
            {
               self.allRecipeTableView.insertRows(at: [currentIndexPath!], with: .fade)
            }
        }
    }
    
}

