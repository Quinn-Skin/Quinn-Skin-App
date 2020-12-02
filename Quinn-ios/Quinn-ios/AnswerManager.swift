//
//  AnswerManager.swift
//  Quinn-ios
//
//  Created by Brayhan De Aza on 12/2/20.
//

import UIKit

class AnswersManager {
    static var shared = AnswersManager()
    var productId : String = ""
    var answers = [
        "label": nil,
        "price": nil,
        "combination": nil,
        "normal": nil,
        "oily": nil,
        "sensitive": nil
    ] as [String : Any?]
    
}

