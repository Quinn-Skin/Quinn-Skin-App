//
//  BudgetViewController.swift
//  Quinn-ios
//
//  Created by Brayhan De Aza on 11/27/20.
//

import UIKit

class BudgetViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var VCView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var budgetCollectionView: UICollectionView!
    
    let cornerRadius = 20
    var answers = ["$25 Or Less", "$25-$50", "Over $50"]

//  colors
    let leatherColor = UIColor(red: 254.0/255.0, green: 150.0/255.0, blue: 0/255.0, alpha: 1.0)
    let greenColor = UIColor(red: 32.0/255.0, green: 34.0/255.0, blue: 37.0/255.5, alpha: 1.0)
    let creamColor = UIColor(red: 252.0/255.0, green: 249.0/255.0, blue: 226.0/255.5, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.layoutIfNeeded()
        
        budgetCollectionView.dataSource = self
        budgetCollectionView.delegate = self
        messageView.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BudgetCell", for: indexPath) as! BudgetCell
        cell.answerButton.text = self.answers[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! BudgetCell
//        print(self.answers[indexPath.row])
        selectedCell.layer.backgroundColor = self.leatherColor.cgColor
        self.handleSelectedCell(selectedCell: self.answers[indexPath.row])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! BudgetCell
        selectedCell.layer.backgroundColor = self.creamColor.cgColor
    }
    
    func handleSelectedCell(selectedCell: String) -> Void {
        if selectedCell == "$25 Or Less" {
            AnswersManager.shared.answers["price"] = 25
            print(AnswersManager.shared.answers["price"]!!)
            
        } else if selectedCell == "$25-$50" {
            AnswersManager.shared.answers["price"] = 50
            print(AnswersManager.shared.answers["price"]!!)
            
        } else if selectedCell == "Over $50" {
            AnswersManager.shared.answers["price"] = 60
            print(AnswersManager.shared.answers["price"]!!)
            
        }
    }
}

