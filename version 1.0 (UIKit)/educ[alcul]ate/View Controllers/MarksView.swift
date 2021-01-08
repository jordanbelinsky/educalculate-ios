//
//  MarksView.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-23.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import UIKit

class MarksView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navItem: UINavigationItem!
    
    var parentClass: Class?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navItem.title = parentClass?.value(forKey: "name") as? String
        tableView.tableFooterView = UIView()
        
        applyTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        applyTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    @IBAction func addNewAssignment(_ sender: Any) {
        performSegue(withIdentifier: "showAssignment", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddAssignment else {
            return
        }
        
        destination.parentClass = parentClass
    }
    
    func deleteMark(at indexPath: IndexPath) {
        guard let mark = parentClass?.marks?[indexPath.row], let context = mark.managedObjectContext else {
            return
        }
        
        context.delete(mark)
        
        do {
            try context.save()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            tableView.reloadRows(at: [indexPath], with: .automatic)
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

extension MarksView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parentClass?.marks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "markCell", for: indexPath)
        if let mark = parentClass?.marks?[indexPath.row] {
            cell.textLabel?.text = mark.name
            cell.textLabel?.textColor = Theme.current.fontColor
            cell.layer.backgroundColor = UIColor.clear.cgColor
            let value = mark.value
            cell.detailTextLabel?.text = "\(value)%"
            cell.detailTextLabel?.textColor = Theme.current.fontColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteMark(at: indexPath)
        }
    }
}
