//
//  BudgetViewController.swift
//  Quinn-ios
//
//  Created by Brayhan De Aza on 11/27/20.
//

import UIKit

class BudgetViewController: UIViewController {
    @IBOutlet var VCView: UIView!
    @IBOutlet weak var twentyFiveButton: UIButton!
    @IBOutlet weak var twentyFiveToFiftyButton: UIButton!
    @IBOutlet weak var overFiftyButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    let cornerRadius = 20

//  colors
    let leatherColor = UIColor(red: 254.0/255.0, green: 150.0/255.0, blue: 0/255.0, alpha: 1.0)
    let greenColor = UIColor(red: 32.0/255.0, green: 34.0/255.0, blue: 37.0/255.5, alpha: 1.0)
    let creamColor = UIColor(red: 252.0/255.0, green: 249.0/255.0, blue: 226.0/255.5, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        twentyFiveButton.layer.cornerRadius = CGFloat(cornerRadius)
        twentyFiveToFiftyButton.layer.cornerRadius = CGFloat(cornerRadius)
        overFiftyButton.layer.cornerRadius = CGFloat(cornerRadius)
        nextButton.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    @IBAction func onTwintyFiveOrLess(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor =  leatherColor.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = creamColor.cgColor
        overFiftyButton.layer.backgroundColor = creamColor.cgColor
        
        AnswersManager.shared.answers["price"] = 25
        print(AnswersManager.shared.answers["price"]!!)
    }
    
    @IBAction func onTwentyFiveToFifty(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor =  creamColor.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = leatherColor.cgColor
        overFiftyButton.layer.backgroundColor = creamColor.cgColor
        
        AnswersManager.shared.answers["price"] = 50
        print(AnswersManager.shared.answers["price"]!!)
    }
    
    @IBAction func overFifty(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor =  creamColor.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = creamColor.cgColor
        overFiftyButton.layer.backgroundColor = leatherColor.cgColor
        
        AnswersManager.shared.answers["price"] = 60
        print(AnswersManager.shared.answers["price"]!!)
    }
}
