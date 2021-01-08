//
//  Mark+CoreDataClass.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-23.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Mark)
public class Mark: NSManagedObject {
    convenience init?(name: String?, value: Double) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Mark.entity(), insertInto: context)
        
        self.name = name
        self.value = value
    }
}
