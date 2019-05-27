//
//  Settings.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-22.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import UIKit

class Settings: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var version: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var twitter: UILabel!
    @IBOutlet weak var instagram: UILabel!
    @IBOutlet weak var github: UILabel!
    @IBOutlet weak var themeSwitchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profile.layer.borderWidth = 0.25
        profile.layer.masksToBounds = false
        profile.layer.borderColor = UIColor.black.cgColor
        profile.layer.cornerRadius = profile.frame.height/2
        profile.clipsToBounds = true

        version.text = "Version: 1.0~b10"
        
        themeSwitch.setOn(UserDefaults.standard.bool(forKey: "DarkTheme"), animated: true)
        
        applyTheme()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        applyTheme()
    }
    
    @IBAction func themeChanged(_ sender: UISwitch) {
        Theme.current = sender.isOn ? DarkTheme() : LightTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "DarkTheme")
        applyTheme()
    }
    
    func applyTheme() {
        view.backgroundColor = Theme.current.background
        UINavigationBar.appearance().barTintColor = Theme.current.accent
        self.tabBarController?.tabBar.barTintColor = Theme.current.accent
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.fontColor]
        name.textColor = Theme.current.fontColor
        subtitle.textColor = Theme.current.fontColor
        email.textColor = Theme.current.fontColor
        website.textColor = Theme.current.fontColor
        twitter.textColor = Theme.current.fontColor
        instagram.textColor = Theme.current.fontColor
        github.textColor = Theme.current.fontColor
        themeSwitchLabel.textColor = Theme.current.fontColor
    }
}
