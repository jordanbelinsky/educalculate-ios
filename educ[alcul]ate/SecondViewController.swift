/////////////////////////////////////////////////////////////
//  File Name:          SecondViewController.swift         //
//  Application Name:   educ[alcul]ate                     //
//                                                         //
//  Created by Jordan Belinsky on 2019-05-12.              //
//  Copyright © 2019 Jordan Belinsky. All rights reserved. //
/////////////////////////////////////////////////////////////

// import UI library for UI elements
import UIKit

// app view controller class
class SecondViewController: UIViewController {
    
    // declare text field inputs
    @IBOutlet weak var cMInput: UITextField!
    @IBOutlet weak var fMInput: UITextField!
    @IBOutlet weak var wInput: UITextField!
    
    // declare UI labels
    @IBOutlet weak var markOutput: UILabel!
    @IBOutlet weak var version: UILabel!
    
    // default loading characteristics
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display version number
        version.text = "Version: 1.0~b4"
        
        // check for general taps around screen area to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // setup for numpad support
        cMInput.keyboardType = UIKeyboardType.decimalPad
        fMInput.keyboardType = UIKeyboardType.decimalPad
        wInput.keyboardType = UIKeyboardType.decimalPad
    }

    // function to dismiss keyboard on tap
    @objc func dismissKeyboard() {
        // prompts view to resign first responder status
        view.endEditing(true)
    }
    
    // function to calculate the exam mark required given current and final marks
    func finalExam(current: Double, final: Double, weight: Double) -> Double {
        
        // decalre variables
        var required: Double
        
        // calculate the required mark
        required = (100 * final - (100 - weight) * current) / weight
        
        // return required value from function
        return required
    }
    
    // event handling for calculate mark button
    @IBAction func calculateMark(_ sender: Any) {
        
        // first responder revokation
        cMInput.resignFirstResponder()
        fMInput.resignFirstResponder()
        wInput.resignFirstResponder()
        
        // convert string values to integers
        let currentMark = (cMInput.text! as NSString).doubleValue
        let endMark = (fMInput.text! as NSString).doubleValue
        let weighting = (wInput.text! as NSString).doubleValue
        
        // define and calculate the final mark
        var finalMark: Double
        var markRound: Double
        
        finalMark = finalExam(current: currentMark, final: endMark, weight: weighting)
        markRound = (finalMark * 100).rounded() / 100
        
        // display the final mark in string form
        markOutput.text = "The mark you need is: \(markRound)%"
    }
    
}

