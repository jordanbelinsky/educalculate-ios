//
//  ThemeProtocol.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-27.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    var accent: UIColor { get }
    var background: UIColor { get }
    var navTab: UIColor { get }
    var placeholder: UIColor { get }
    var fontColor: UIColor { get }
}
