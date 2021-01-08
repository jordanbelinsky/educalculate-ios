//
//  Calculations.swift
//  educ[alcul]ate
//
//  Created by Jordan Belinsky on 2019-05-23.
//  Copyright © 2019 Jordan Belinsky. All rights reserved.
//

import Foundation

func weightedAverage2(m1: Double, m2: Double, w1: Double, w2: Double) -> Double {
    var numerator: Double
    var denominator: Double
    var average: Double
    
    numerator = (m1 * w1) + (m2 * w2)
    denominator = w1 + w2
    
    average = numerator / denominator
    
    return average
}

func weightedAverage3(m1: Double, m2: Double, m3: Double, w1: Double, w2: Double, w3: Double) -> Double {
    var numerator: Double
    var denominator: Double
    var average: Double
    
    numerator = (m1 * w1) + (m2 * w2) + (m3 * w3)
    denominator = w1 + w2 + w3
    
    average = numerator / denominator
    
    return average
}

func weightedAverage4(m1: Double, m2: Double, m3: Double, m4: Double, w1: Double, w2: Double, w3: Double, w4: Double) -> Double {
    var numerator: Double
    var denominator: Double
    var average: Double

    numerator = (m1 * w1) + (m2 * w2) + (m3 * w3) + (m4 * w4)
    denominator = w1 + w2 + w3 + w4

    average = numerator / denominator

    return average
}

func weightedAverage5(m1: Double, m2: Double, m3: Double, m4: Double, m5: Double, w1: Double, w2: Double, w3: Double, w4: Double, w5: Double) -> Double {
    var numerator: Double
    var denominator: Double
    var average: Double

    numerator = (m1 * w1) + (m2 * w2) + (m3 * w3) + (m4 * w4) + (m5 * w5)
    denominator = w1 + w2 + w3 + w4 + w5

    average = numerator / denominator

    return average
}

func finalExam(current: Double, final: Double, weight: Double) -> Double {
    var required: Double
    
    required = (100 * final - (100 - weight) * current) / weight

    return required
}

func finalMark(current: Double, exam: Double, weight: Double) -> Double {
    var final: Double

    final = (100 - weight) * current + (weight * exam)

    return final
}
