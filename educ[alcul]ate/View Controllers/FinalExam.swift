//
//  FinalExam.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-22.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import UIKit

class FinalExam: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var calcButton: UIButton!
    
    @IBOutlet weak var cMInput: UITextField!
    @IBOutlet weak var fMInput: UITextField!
    @IBOutlet weak var wInput: UITextField!
    
    @IBOutlet weak var markOutput: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var calcType: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FinalExam.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        cMInput.keyboardType = UIKeyboardType.decimalPad
        fMInput.keyboardType = UIKeyboardType.decimalPad
        wInput.keyboardType = UIKeyboardType.decimalPad
        
        applyTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        applyTheme()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            calcType.text = "What is the mark you want to end with:"
            fMInput.placeholder = "Enter desired final mark (%)"
            markOutput.text = "The mark you need is:"
            calcButton.setTitle("Calculate Exam Mark", for: .normal)
        case 1:
            calcType.text = "What is the exam mark you want:"
            fMInput.placeholder = "Enter desired exam mark (%)"
            markOutput.text = "Your final average is:"
            calcButton.setTitle("Calculate Final Average", for: .normal)
        default:
            break
        }
    }
    
    @IBAction func calculateMark(_ sender: Any) {
        cMInput.resignFirstResponder()
        fMInput.resignFirstResponder()
        wInput.resignFirstResponder()
        
        switch segmentedControl.selectedSegmentIndex {
            
        // exam mark
        case 0:
            if (cMInput.text == "" || fMInput.text == "" || wInput.text == "") {
                markOutput.text = "Please input values"
            } else {
                let currentMark = (cMInput.text! as NSString).doubleValue
                let endMark = (fMInput.text! as NSString).doubleValue
                let weighting = (wInput.text! as NSString).doubleValue
                
                if (0...100 ~= currentMark) && (0...100 ~= endMark) && (0...100 ~= weighting) {
                    var finalExamMark: Double
                    var markRound: Double
                    
                    finalExamMark = finalExam(current: currentMark, final: endMark, weight: weighting)
                    markRound = (finalExamMark * 100).rounded() / 100
                    
                    markOutput.text = "The mark you need is: \(markRound)%"
                } else {
                    markOutput.text = "Inputs must be between 0 - 100"
                }
            }
            
        // final mark
        case 1:
            if (cMInput.text == "" || fMInput.text == "" || wInput.text == "") {
                markOutput.text = "Please input values"
            } else {
                let currentMark = (cMInput.text! as NSString).doubleValue
                let examMark = (fMInput.text! as NSString).doubleValue
                let weighting = (wInput.text! as NSString).doubleValue
                
                if (0...100 ~= currentMark) && (0...100 ~= examMark) && (0...100 ~= weighting) {
                    var finalCourseMark: Double
                    var markRound: Double
                    
                    finalCourseMark = finalMark(current: currentMark, exam: examMark, weight: weighting)
                    markRound = (finalCourseMark).rounded() / 100
                    
                    markOutput.text = "Your final average is: \(markRound)%"
                } else {
                    markOutput.text = "Inputs must be between 0 - 100"
                }
            }
        default:
            break
        }
    }
    
    func applyTheme() {
        view.backgroundColor = Theme.current.background
        UINavigationBar.appearance().barTintColor = Theme.current.navTab
        self.tabBarController?.tabBar.barTintColor = Theme.current.navTab
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.fontColor]
        label1.textColor = Theme.current.fontColor
        calcType.textColor = Theme.current.fontColor
        label3.textColor = Theme.current.fontColor
        cMInput.backgroundColor = Theme.current.accent
        cMInput.attributedPlaceholder = NSAttributedString(string: "Enter current mark (%)", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.fontColor])
        cMInput.textColor = Theme.current.fontColor
        fMInput.backgroundColor = Theme.current.accent
        fMInput.textColor = Theme.current.fontColor
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            fMInput.attributedPlaceholder = NSAttributedString(string: "Enter desired final mark (%)", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.fontColor])
        case 1:
            fMInput.attributedPlaceholder = NSAttributedString(string: "Enter desired exam mark (%)", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.fontColor])
        default:
            break
        }
        wInput.backgroundColor = Theme.current.accent
        wInput.attributedPlaceholder = NSAttributedString(string: "Enter your exam weight (%)", attributes: [NSAttributedString.Key.foregroundColor: Theme.current.fontColor])
        wInput.textColor = Theme.current.fontColor
        markOutput.textColor = Theme.current.fontColor
    }
    
}
