//
//  Class+CoreDataClass.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-23.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Class)
public class Class: NSManagedObject {
    var marks: [Mark]? {
        return self.rawMarks?.array as? [Mark]
    }
    
    
    convenience init?(name: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Class.entity(), insertInto: context)
        
        self.name = name
    }
}
