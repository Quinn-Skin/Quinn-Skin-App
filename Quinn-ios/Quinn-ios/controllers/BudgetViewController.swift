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
//        self.modelCaller()
        
        twentyFiveButton.layer.cornerRadius = CGFloat(cornerRadius)
        twentyFiveToFiftyButton.layer.cornerRadius = CGFloat(cornerRadius)
        overFiftyButton.layer.cornerRadius = CGFloat(cornerRadius)
        nextButton.layer.cornerRadius = CGFloat(cornerRadius)
        
//        AnswersManager.shared.productId = "2"
        
        //let parameters = ["Label":2,"price":10,"score":5,"Combination":1,"Dry":0,"Normal":1,"Oily":0,"Sensitive":1]
        let parameters:[[Int]] = [[2,10,4,1,0,0,0,0]]

        let url = URL(string: "https://quinn-model.herokuapp.com/productid")
        let session = URLSession.shared

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters,options: JSONSerialization.WritingOptions.prettyPrinted)
            
        } catch let error{
            print(error.localizedDescription)
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")


        let task = session.uploadTask(with: request as URLRequest,from: request.httpBody) {data, response,error in
            guard error == nil else{
                return
            }
        
            if let data = data, let dataString = String(data:data,encoding: .utf8) {
                AnswersManager.shared.productId = dataString
//                AnswersManager.shared.productId = "12"
            }
        }
        task.resume()
        
    }
    
    @IBAction func onTwintyFiveOrLess(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor =  leatherColor.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = creamColor.cgColor
        overFiftyButton.layer.backgroundColor = creamColor.cgColor
    }
    
    @IBAction func onTwentyFiveToFifty(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor =  creamColor.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = leatherColor.cgColor
        overFiftyButton.layer.backgroundColor = creamColor.cgColor
        
        AnswersManager.shared.answers["price"] = 50
//        print(AnswersManager.shared.answers["price"]!!)
    }
    
    @IBAction func overFifty(_ sender: Any) {
        twentyFiveButton.layer.backgroundColor =  creamColor.cgColor
        twentyFiveToFiftyButton.layer.backgroundColor = creamColor.cgColor
        overFiftyButton.layer.backgroundColor = leatherColor.cgColor
        
        AnswersManager.shared.answers["price"] = 60
//        print(AnswersManager.shared.answers["price"]!!)
    }
    
    @IBAction func onNext(_ sender: Any) {
        nextButton.layer.backgroundColor = leatherColor.cgColor
       
    }
    
    func modelCaller() -> Void {
       
        //let parameters = ["Label":2,"price":10,"score":5,"Combination":1,"Dry":0,"Normal":1,"Oily":0,"Sensitive":1]
        let parameters:[[Int]] = [[2,10,4,1,0,0,0,0]]

        let url = URL(string: "https://quinn-model.herokuapp.com/productid")
        let session = URLSession.shared

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters,options: JSONSerialization.WritingOptions.prettyPrinted)
            
        } catch let error{
            print(error.localizedDescription)
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")


        let task = session.uploadTask(with: request as URLRequest,from: request.httpBody) {data, response,error in
            guard error == nil else{
                return
            }
        
            if let data = data, let dataString = String(data:data,encoding: .utf8) {
                AnswersManager.shared.productId = "\(dataString)"
                print(dataString)
            }
        }
        task.resume()
    }
}
