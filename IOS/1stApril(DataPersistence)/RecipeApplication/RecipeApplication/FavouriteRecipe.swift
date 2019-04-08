//
//  FavouriteRecipe.swift
//  RecipeApplication
//
//  Created by Akash Verma on 02/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit
import CoreData

class FavouriteRecipe: UIViewController
{
    @IBOutlet weak var favouriteRicepeTableView: UITableView!
    
    fileprivate lazy var fetchedResultController1: NSFetchedResultsController<Recipe> = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        fetchRequest.predicate = NSPredicate(format: "favorite == true") // NSPredicate setting so that only rows with true value in attribute favorite will be fetched
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self as? NSFetchedResultsControllerDelegate
        try! fetchResultController.performFetch()
        return fetchResultController
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        favouriteRicepeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func onLogoutNavButtonTap()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
extension FavouriteRecipe : UITableViewDataSource , UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return (fetchedResultController1.fetchedObjects?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let recipe1 = fetchedResultController1.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = recipe1.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
extension FavouriteRecipe : NSFetchedResultsControllerDelegate
{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        favouriteRicepeTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>)
    {
        favouriteRicepeTableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?)
    {
        if(type == .delete)
        {
            favouriteRicepeTableView.deleteRows(at: [indexPath!] , with: .fade)
            
        }
        else if(type == .insert)
        {
            let currentIndexPath = self.fetchedResultController1.indexPath(forObject: anObject as! Recipe)
            if(currentIndexPath != nil)
            {
                self.favouriteRicepeTableView.insertRows(at: [currentIndexPath!], with: .fade)
            }
        }
        else if(type == .update)
        {
            favouriteRicepeTableView.deleteRows(at: [indexPath!] , with: .fade)
            let currentIndexPath = self.fetchedResultController1.indexPath(forObject: anObject as! Recipe)
            if(currentIndexPath != nil)
            {
                self.favouriteRicepeTableView.insertRows(at: [currentIndexPath!], with: .fade)
            }
        }
    }
    
}
