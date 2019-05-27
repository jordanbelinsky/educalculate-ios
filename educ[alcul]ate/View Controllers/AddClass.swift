//
//  AddClass.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-23.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import UIKit
import CoreData

class AddClass: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    
    var parentClass: Class?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameInput.delegate = self
        // Do any additional setup after loading the view.
        
        applyTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        applyTheme()
    }
    
    @IBAction func saveClass(_ sender: Any) {
        let newClass = Class(name: nameInput.text ?? "")
        
        do {
            try newClass?.managedObjectContext?.save()
            self.navigationController?.popViewController(animated: true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func applyTheme() {
        view.backgroundColor = Theme.current.background
        UINavigationBar.appearance().barTintColor = Theme.current.accent
        self.tabBarController?.tabBar.barTintColor = Theme.current.accent
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.fontColor]
        nameLabel.textColor = Theme.current.fontColor
        nameInput.backgroundColor = Theme.current.accent
        nameInput.textColor = Theme.current.fontColor
    }

}

extension AddClass: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
