//
//  ScentViewController.swift
//  Quinn-ios
//
//  Created by Tasha Ip Ying Ler on 12/7/20.
//

import UIKit

class ScentViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var ScentCollectionView: UICollectionView!
    let streets = ["Citrus", "Fresh", "Woodsy","None"]
    let cornerRadius = 20
    let totalColors: Int = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 20
        ScentCollectionView.dataSource = self
        ScentCollectionView.delegate = self
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ScentCollectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! ScentAnswerCell
        cell.questionLabel.text = streets[indexPath.row]
         cell.layer.cornerRadius = CGFloat(cornerRadius)
           print("working")
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Selected cell number: \(indexPath.row)")
        let selectedCell:UICollectionViewCell = ScentCollectionView.cellForItem(at: indexPath)!
        print("change color")
        let _:UICollectionViewCell = ScentCollectionView.cellForItem(at: indexPath)!
               selectedCell.contentView.backgroundColor = UIColor(red: 102/256, green: 255/256, blue: 255/256, alpha: 0.66)
        
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cellToDeselect:UICollectionViewCell = ScentCollectionView.cellForItem(at: indexPath as IndexPath)!
        cellToDeselect.contentView.backgroundColor = UIColor.clear
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

    @IBAction func onSubmitButton(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
