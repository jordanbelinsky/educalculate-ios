/////////////////////////////////////////////////////////////
//  File Name:          FirstViewController.swift          //
//  Application Name:   educ[alcul]ate                     //
//                                                         //
//  Created by Jordan Belinsky on 2019-05-12.              //
//  Copyright © 2019 Jordan Belinsky. All rights reserved. //
/////////////////////////////////////////////////////////////

// import UI library for UI elements
import UIKit

// app view controller class
class FirstViewController: UIViewController {
    
    // declare mark inputs
    @IBOutlet var mInput1: UITextField!
    @IBOutlet var mInput2: UITextField!
    @IBOutlet var mInput3: UITextField!
    @IBOutlet weak var mInput4: UITextField!
    @IBOutlet weak var mInput5: UITextField!
    
    // declare weight inputs
    @IBOutlet weak var wInput1: UITextField!
    @IBOutlet weak var wInput2: UITextField!
    @IBOutlet weak var wInput3: UITextField!
    @IBOutlet weak var wInput4: UITextField!
    @IBOutlet weak var wInput5: UITextField!
    
    // declare UI labels
    @IBOutlet weak var averageOutput: UILabel!
    @IBOutlet weak var version: UILabel!
    
    // default loading characteristics
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display version number
        version.text = "Version: 1.0~b4"
        
        // check for general taps around screen area to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // setup for numpad support
        mInput1.keyboardType = UIKeyboardType.decimalPad
        mInput2.keyboardType = UIKeyboardType.decimalPad
        mInput3.keyboardType = UIKeyboardType.decimalPad
        mInput4.keyboardType = UIKeyboardType.decimalPad
        mInput5.keyboardType = UIKeyboardType.decimalPad
        wInput1.keyboardType = UIKeyboardType.decimalPad
        wInput2.keyboardType = UIKeyboardType.decimalPad
        wInput3.keyboardType = UIKeyboardType.decimalPad
        wInput4.keyboardType = UIKeyboardType.decimalPad
        wInput5.keyboardType = UIKeyboardType.decimalPad
    }
    
    // function to calculate the weighted average given 5 marks and weightings
    func weightedAverage(m1: Double, m2: Double, m3: Double, m4: Double, m5: Double, w1: Double, w2: Double, w3: Double, w4: Double, w5: Double) -> Double {
        
        // declare numerator, denominator and average integers for calculation
        var numerator: Double
        var denominator: Double
        var average: Double
        
        // calculate numerator and denominator
        numerator = (m1 * w1) + (m2 * w2) + (m3 * w3) + (m4 * w4) + (m5 * w5)
        denominator = w1 + w2 + w3 + w4 + w5
        
        // calculate final average
        average = numerator / denominator
        
        // return an integer value of the final average
        return average
    }
    
    // function to dismiss keyboard on tap
    @objc func dismissKeyboard() {
        // prompts view to resign first responder status
        view.endEditing(true)
    }
    
    
    // event handling for calculate average button
    @IBAction func calculateAverage(_ sender: Any) {
        
        // mark first responder revokation
        mInput1.resignFirstResponder()
        mInput2.resignFirstResponder()
        mInput3.resignFirstResponder()
        mInput4.resignFirstResponder()
        mInput5.resignFirstResponder()
        
        // weight first responder revokation
        wInput1.resignFirstResponder()
        wInput2.resignFirstResponder()
        wInput3.resignFirstResponder()
        wInput4.resignFirstResponder()
        wInput5.resignFirstResponder()
        
        // error - empty marks
        if (mInput1.text == "" || mInput2.text == "" || mInput3.text == "" || mInput4.text == "" || mInput5.text == "") && (wInput1.text != "" || wInput2.text != "" || wInput3.text != "" || wInput4.text != "" || wInput5.text != "") {
            averageOutput.text = "Please input values for marks"
        // error - empty weights
        } else if (wInput1.text == "" || wInput2.text == "" || wInput3.text == "" || wInput4.text == "" || wInput5.text == "") && (mInput1.text != "" || mInput2.text != "" || mInput3.text != "" || mInput4.text != "" || mInput5.text != "") {
            averageOutput.text = "Please input values for weights"
        // error - all fields empty
        } else if (mInput1.text == "" || mInput2.text == "" || mInput3.text == "" || mInput4.text == "" || mInput5.text == "") && (wInput1.text == "" || wInput2.text == "" || wInput3.text == "" || wInput4.text == "" || wInput5.text == "") {
            averageOutput.text = "Please input values for marks and weights"
        // no errors
        } else {
            // convert string input into integers
            let mark1 = (mInput1.text! as NSString).doubleValue
            let mark2 = (mInput2.text! as NSString).doubleValue
            let mark3 = (mInput3.text! as NSString).doubleValue
            let mark4 = (mInput4.text! as NSString).doubleValue
            let mark5 = (mInput5.text! as NSString).doubleValue
            let weight1 = (wInput1.text! as NSString).doubleValue
            let weight2 = (wInput2.text! as NSString).doubleValue
            let weight3 = (wInput3.text! as NSString).doubleValue
            let weight4 = (wInput4.text! as NSString).doubleValue
            let weight5 = (wInput5.text! as NSString).doubleValue
            
            if (0...100 ~= mark1) && (0...100 ~= mark2) && (0...100 ~= mark3) && (0...100 ~= mark4) && (0...100 ~= mark5) {
                if (weight1 + weight2 + weight3 + weight4 + weight5) <= 100 {
                    // define and calculate the final weighted average
                    var finalAvg: Double
                    var avgRound: Double
                    finalAvg = weightedAverage(m1: mark1, m2: mark2, m3: mark3, m4: mark4, m5: mark5, w1: weight1, w2: weight2, w3: weight3, w4: weight4, w5: weight5)
                    avgRound = (finalAvg * 100).rounded() / 100
                    
                    // display the final average in string form
                    averageOutput.text = "Your average is: \(avgRound)%"
                } else {
                    averageOutput.text = "The sum of all weights must be <= 100"
                }
            } else {
                averageOutput.text = "Marks must be between 0 - 100"
            }
            
            
        }
    }
}
