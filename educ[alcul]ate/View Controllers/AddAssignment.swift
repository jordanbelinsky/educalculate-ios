//
//  AddAssignment.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-23.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import UIKit

class AddAssignment: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueInput: UITextField!
    
    var parentClass: Class?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameInput.delegate = self
        valueInput.delegate = self
        // Do any additional setup after loading the view.
        
        applyTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        applyTheme()
    }
    
    @IBAction func saveMark(_ sender: Any) {
        let name = nameInput.text
        let valueText = valueInput.text ?? ""
        let value = Double(valueText) ?? 0.0
        
        if let mark = Mark(name: name, value: value) {
            parentClass?.addToRawMarks(mark)
            
            do {
                try mark.managedObjectContext?.save()
                self.navigationController?.popViewController(animated: true)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func applyTheme() {
        view.backgroundColor = Theme.current.background
        UINavigationBar.appearance().barTintColor = Theme.current.accent
        self.tabBarController?.tabBar.barTintColor = Theme.current.accent
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.fontColor]
        nameInput.backgroundColor = Theme.current.accent
        nameInput.textColor = Theme.current.fontColor
        valueInput.backgroundColor = Theme.current.accent
        valueInput.textColor = Theme.current.fontColor
        nameLabel.textColor = Theme.current.fontColor
        valueLabel.textColor = Theme.current.fontColor
    }

}

extension AddAssignment: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
