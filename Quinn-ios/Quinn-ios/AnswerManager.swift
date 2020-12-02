//
//  AnswerManager.swift
//  Quinn-ios
//  Created by Brayhan De Aza on 12/2/20.

import UIKit

class AnswersManager {
    static var shared = AnswersManager()
    var productId : String = ""
    var answers = [
        "label": nil,
        "price": 30,
        "score": 4,
        "dry": 0,
        "combination": 0,
        "normal": 0,
        "oily": 0,
        "sensitive": 0
    ] as [String : Any?]
}
