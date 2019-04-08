//
//  UpdateRecipe.swift
//  RecipeApplication
//
//  Created by Akash Verma on 04/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//
//UserDefaults.standard.object(forKey: "abc")
import UIKit
import CoreData

class UpdateRecipe: UIViewController , NSFetchRequestResult , SavingDataToDB
{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var madeByTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var originTextField: UITextField!
    @IBOutlet weak var ingrediantsTextField: UITextField!
    @IBOutlet weak var favoriteTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    

    fileprivate lazy var fetchedResultController: NSFetchedResultsController<Recipe> =
    {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        fetchRequest.predicate = NSPredicate(format: "name == '\(UserDefaults.standard.object(forKey: "abc")!)'")
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context!, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self as? NSFetchedResultsControllerDelegate
        try! fetchResultController.performFetch()
        return fetchResultController
    }()
    

    override func viewDidLoad()
    {
            let recipe1 = fetchedResultController.fetchedObjects?.first
            nameTextField.text = recipe1!.name!
            madeByTextField.text = recipe1!.madeBy!
            timeTextField.text = recipe1!.time!
            originTextField.text = recipe1!.origin!
            ingrediantsTextField.text = recipe1!.ingrediants!
            favoriteTextField.text = String(recipe1!.favorite)
            //print(recipe1!.name!)
        super.viewDidLoad()
    }
    
    @IBAction func onUpdateButtonTap(_ sender: Any)
    {
        let recipe1 = fetchedResultController.fetchedObjects?.first
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        recipe1!.setValue(nameTextField.text!, forKey: "name")
        recipe1!.setValue(madeByTextField.text!, forKey: "madeBy")
        recipe1!.setValue(timeTextField.text!, forKey: "time")
        recipe1!.setValue(originTextField.text!, forKey: "origin")
        recipe1!.setValue(ingrediantsTextField.text!, forKey: "ingrediants")
        recipe1!.setValue(Bool(favoriteTextField.text!), forKey: "favorite")
        do
        {
            try context.save()
        }
        catch{
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCancelButtonTap(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
}
