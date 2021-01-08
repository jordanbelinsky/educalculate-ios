//
//  WeightedAverage.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-22.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import UIKit

class WeightedAverage: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var mInput1: UITextField!
    @IBOutlet weak var mInput2: UITextField!
    @IBOutlet weak var mInput3: UITextField!
    @IBOutlet weak var mInput4: UITextField!
    @IBOutlet weak var mInput5: UITextField!
    @IBOutlet weak var wInput1: UITextField!
    @IBOutlet weak var wInput2: UITextField!
    @IBOutlet weak var wInput3: UITextField!
    @IBOutlet weak var wInput4: UITextField!
    @IBOutlet weak var wInput5: UITextField!
    
    @IBOutlet weak var averageOutput: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WeightedAverage.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
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
        
        UINavigationBar.appearance().barTintColor = Theme.current.accent
        applyTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        applyTheme()
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mInput1.isHidden = false
            mInput2.isHidden = false
            mInput3.isHidden = true
            mInput4.isHidden = true
            mInput5.isHidden = true
            wInput1.isHidden = false
            wInput2.isHidden = false
            wInput3.isHidden = true
            wInput4.isHidden = true
            wInput5.isHidden = true
        case 1:
            mInput1.isHidden = false
            mInput2.isHidden = false
            mInput3.isHidden = false
            mInput4.isHidden = true
            mInput5.isHidden = true
            wInput1.isHidden = false
            wInput2.isHidden = false
            wInput3.isHidden = false
            wInput4.isHidden = true
            wInput5.isHidden = true
        case 2:
            mInput1.isHidden = false
            mInput2.isHidden = false
            mInput3.isHidden = false
            mInput4.isHidden = false
            mInput5.isHidden = true
            wInput1.isHidden = false
            wInput2.isHidden = false
            wInput3.isHidden = false
            wInput4.isHidden = false
            wInput5.isHidden = true
        case 3:
            mInput1.isHidden = false
            mInput2.isHidden = false
            mInput3.isHidden = false
            mInput4.isHidden = false
            mInput5.isHidden = false
            wInput1.isHidden = false
            wInput2.isHidden = false
            wInput3.isHidden = false
            wInput4.isHidden = false
            wInput5.isHidden = false
        default:
            break
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func calculateAverage(_ sender: Any) {
        mInput1.resignFirstResponder()
        mInput2.resignFirstResponder()
        mInput3.resignFirstResponder()
        mInput4.resignFirstResponder()
        mInput5.resignFirstResponder()
        wInput1.resignFirstResponder()
        wInput2.resignFirstResponder()
        wInput3.resignFirstResponder()
        wInput4.resignFirstResponder()
        wInput5.resignFirstResponder()
        
        switch segmentedControl.selectedSegmentIndex {
            
        // 2 marks
        case 0:
            if (mInput1.text == "" || mInput2.text == "" || wInput1.text == "" || wInput2.text == "") {
                averageOutput.text = "Please input values for marks and weights"
            } else {
                let mark1 = (mInput1.text! as NSString).doubleValue
                let mark2 = (mInput2.text! as NSString).doubleValue
                let weight1 = (wInput1.text! as NSString).doubleValue
                let weight2 = (wInput2.text! as NSString).doubleValue
                
                if (0...100 ~= mark1) && (0...100 ~= mark2) {
                    if (weight1 + weight2) <= 100 {
                        var finalAvg: Double
                        var avgRound: Double
                        finalAvg = weightedAverage2(m1: mark1, m2: mark2, w1: weight1, w2: weight2)
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
            
        // 3 marks
        case 1:
            if (mInput1.text == "" || mInput2.text == "" || mInput3.text == "" || wInput1.text == "" || wInput2.text == "" || wInput3.text == "") {
                averageOutput.text = "Please input values for marks and weights"
            } else {
                let mark1 = (mInput1.text! as NSString).doubleValue
                let mark2 = (mInput2.text! as NSString).doubleValue
                let mark3 = (mInput3.text! as NSString).doubleValue
                let weight1 = (wInput1.text! as NSString).doubleValue
                let weight2 = (wInput2.text! as NSString).doubleValue
                let weight3 = (wInput3.text! as NSString).doubleValue
                
                if (0...100 ~= mark1) && (0...100 ~= mark2) && (0...100 ~= mark3) {
                    if (weight1 + weight2 + weight3) <= 100 {
                        var finalAvg: Double
                        var avgRound: Double
                        finalAvg = weightedAverage3(m1: mark1, m2: mark2, m3: mark3, w1: weight1, w2: weight2, w3: weight3)
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
            
        // 4 marks
        case 2:
            if (mInput1.text == "" || mInput2.text == "" || mInput3.text == "" || mInput4.text == "" || wInput1.text == "" || wInput2.text == "" || wInput3.text == "" || wInput4.text == "") {
                averageOutput.text = "Please input values for marks and weights"
            } else {
                let mark1 = (mInput1.text! as NSString).doubleValue
                let mark2 = (mInput2.text! as NSString).doubleValue
                let mark3 = (mInput3.text! as NSString).doubleValue
                let mark4 = (mInput4.text! as NSString).doubleValue
                let weight1 = (wInput1.text! as NSString).doubleValue
                let weight2 = (wInput2.text! as NSString).doubleValue
                let weight3 = (wInput3.text! as NSString).doubleValue
                let weight4 = (wInput4.text! as NSString).doubleValue
                
                if (0...100 ~= mark1) && (0...100 ~= mark2) && (0...100 ~= mark3) && (0...100 ~= mark4) {
                    if (weight1 + weight2 + weight3 + weight4) <= 100 {
                        var finalAvg: Double
                        var avgRound: Double
                        finalAvg = weightedAverage4(m1: mark1, m2: mark2, m3: mark3, m4: mark4, w1: weight1, w2: weight2, w3: weight3, w4: weight4)
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
            
        // 5 marks
        case 3:
            if (mInput1.text == "" || mInput2.text == "" || mInput3.text == "" || mInput4.text == "" || mInput5.text == "" || wInput1.text == "" || wInput2.text == "" || wInput3.text == "" || wInput4.text == "" || wInput5.text == "") {
                averageOutput.text = "Please input values for marks and weights"
            } else {
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
                        var finalAvg: Double
                        var avgRound: Double
                        finalAvg = weightedAverage5(m1: mark1, m2: mark2, m3: mark3, m4: mark4, m5: mark5, w1: weight1, w2: weight2, w3: weight3, w4: weight4, w5: weight5)
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
            
        // default
        default:
            break
        }
    }
    
    func applyTheme() {
        UINavigationBar.appearance().barTintColor = Theme.current.navTab
        self.tabBarController?.tabBar.barTintColor = Theme.current.navTab
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.fontColor]
        
        view.backgroundColor = Theme.current.background
        averageOutput.textColor = Theme.current.fontColor
        label1.textColor = Theme.current.fontColor
        
        mInput1.backgroundColor = Theme.current.accent
        mInput1.attributedPlaceholder = NSAttributedString(string: "Mark #1", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        mInput1.textColor = Theme.current.fontColor
        mInput2.backgroundColor = Theme.current.accent
        mInput2.attributedPlaceholder = NSAttributedString(string: "Mark #2", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        mInput2.textColor = Theme.current.fontColor
        mInput3.backgroundColor = Theme.current.accent
        mInput3.attributedPlaceholder = NSAttributedString(string: "Mark #3", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        mInput3.textColor = Theme.current.fontColor
        mInput4.backgroundColor = Theme.current.accent
        mInput4.attributedPlaceholder = NSAttributedString(string: "Mark #4", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        mInput4.textColor = Theme.current.fontColor
        mInput5.backgroundColor = Theme.current.accent
        mInput5.attributedPlaceholder = NSAttributedString(string: "Mark #5", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        mInput5.textColor = Theme.current.fontColor
        
        wInput1.backgroundColor = Theme.current.accent
        wInput1.attributedPlaceholder = NSAttributedString(string: "Weight #1", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        wInput1.textColor = Theme.current.fontColor
        wInput2.backgroundColor = Theme.current.accent
        wInput2.attributedPlaceholder = NSAttributedString(string: "Weight #2", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        wInput2.textColor = Theme.current.fontColor
        wInput3.backgroundColor = Theme.current.accent
        wInput3.attributedPlaceholder = NSAttributedString(string: "Weight #3", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        wInput3.textColor = Theme.current.fontColor
        wInput4.backgroundColor = Theme.current.accent
        wInput4.attributedPlaceholder = NSAttributedString(string: "Weight #4", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        wInput4.textColor = Theme.current.fontColor
        wInput5.backgroundColor = Theme.current.accent
        wInput5.attributedPlaceholder = NSAttributedString(string: "Weight #5", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.placeholder])
        wInput5.textColor = Theme.current.fontColor
    }
    
}
