/////////////////////////////////////////////////////////////
//  File Name:          ThirdViewController.swift          //
//  Application Name:   educ[alcul]ate                     //
//                                                         //
//  Created by Jordan Belinsky on 2019-05-12.              //
//  Copyright © 2019 Jordan Belinsky. All rights reserved. //
/////////////////////////////////////////////////////////////

// import UI library for UI elements
import UIKit

// app view controller class
class ThirdViewController: UIViewController {
    
    // declare profile picture
    @IBOutlet weak var profile: UIImageView!
    
    // declare UI labels
    @IBOutlet weak var version: UILabel!
    
    // default loading characteristics
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // display profile picture as circle
        profile.layer.borderWidth = 0.25
        profile.layer.masksToBounds = false
        profile.layer.borderColor = UIColor.black.cgColor
        profile.layer.cornerRadius = profile.frame.height/2
        profile.clipsToBounds = true
        
        // display version number
        version.text = "Version: 1.0~b4"
    }
    
}
