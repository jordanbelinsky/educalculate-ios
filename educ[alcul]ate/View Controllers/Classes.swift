//
//  Classes.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-22.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import UIKit
import CoreData

class Classes: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var classes: [Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Classes"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
        
        applyTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        applyTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Class> = Class.fetchRequest()
        
        do {
            classes = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func addClass(_ sender: UIBarButtonItem) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Class> = Class.fetchRequest()
        
        let addAlert = UIAlertController(title: "New Class", message: "Add a new class name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Add", style: .default) {
            [unowned self] action in
            guard let textField = addAlert.textFields?.first, let parentClass = Class(name: textField.text ?? "") else {
                return
            }
            do {
                try parentClass.managedObjectContext?.save()
                self.classes.removeAll()
                self.classes = try context.fetch(fetchRequest)
                self.tableView.reloadData()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        addAlert.addTextField()
        addAlert.addAction(saveAction)
        addAlert.addAction(cancelAction)
        present(addAlert, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let parentClass = classes[indexPath.row]
//        let marks = [parentClass.marks]
//        let setArray = Array(parentClass.rawMarks!) as? [Int] ?? [0]
//        let sumArray = setArray.reduce(0, +)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = parentClass.name
        cell.textLabel?.textColor = Theme.current.fontColor
        cell.layer.backgroundColor = UIColor.clear.cgColor
//        if setArray.count >= 1 {
//            let average = sumArray/setArray.count
//            cell.detailTextLabel?.text = String(average)
//        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? MarksView, let selectedRow = self.tableView.indexPathForSelectedRow?.row else {
            return
        }
        
        destination.parentClass = classes[selectedRow]
    }
    
    func deleteClass(at indexPath: IndexPath) {
        let parentClass = classes[indexPath.row]
        guard let context = parentClass.managedObjectContext else {
            return
        }
        context.delete(parentClass)
        
        do {
            try context.save()
            classes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteClass(at: indexPath)
        }
    }
    
    func applyTheme() {
        view.backgroundColor = Theme.current.background
        UINavigationBar.appearance().barTintColor = Theme.current.navTab
        self.tabBarController?.tabBar.barTintColor = Theme.current.navTab
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.fontColor]
        tableView.backgroundColor = Theme.current.background
        tableView.reloadData()
    }
    
}
