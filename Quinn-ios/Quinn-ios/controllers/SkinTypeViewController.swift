//
//  SkinTypeViewController.swift
//  Quinn-ios
//
//  Created by Yasiris Ortiz on 27.11.20.
//

import UIKit

class SkinTypeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var skinTypeCollectionView: UICollectionView!
    var userAnswer = ["normal", "sensitive", "dry", "oily", "combo"]
    
    //  colors
    let leatherColor = UIColor(red: 254.0/255.0, green: 150.0/255.0, blue: 0/255.0, alpha: 1.0)
    let greenColor = UIColor(red: 32.0/255.0, green: 34.0/255.0, blue: 37.0/255.5, alpha: 1.0)
    let creamColor = UIColor(red: 252.0/255.0, green: 249.0/255.0, blue: 226.0/255.5, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AnswersManager.shared.answers["sensitive"] = 1
        
        skinTypeCollectionView.dataSource = self
        skinTypeCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.userAnswer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkinTypeCell", for: indexPath) as? SkinTypeCell
        cell?.layer.backgroundColor = self.leatherColor.cgColor
        cell?.buttonName.text = self.userAnswer[indexPath.row].capitalized
        cell?.buttonName.layer.cornerRadius = 15
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! SkinTypeCell
        selectedCell.layer.backgroundColor = self.creamColor.cgColor
        self.handleAnswers(answer: self.userAnswer[indexPath.row])
//        print(userAnswer[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! SkinTypeCell
        selectedCell.layer.backgroundColor = self.leatherColor.cgColor
    }
    
    func handleAnswers(answer: String) -> Void {
        if answer == "normal" {
            AnswersManager.shared.answers["normal"] = 1
            AnswersManager.shared.answers["dry"] = 0
            AnswersManager.shared.answers["combination"] = 0
            AnswersManager.shared.answers["oily"] = 0
            AnswersManager.shared.answers["sensitive"] = 0
            
        } else if answer == "dry" {
            AnswersManager.shared.answers["normal"] = 0
            AnswersManager.shared.answers["dry"] = 1
            AnswersManager.shared.answers["combination"] = 0
            AnswersManager.shared.answers["oily"] = 0
            AnswersManager.shared.answers["sensitive"] = 0
            
        } else  if answer == "combo" {
            AnswersManager.shared.answers["normal"] = 0
            AnswersManager.shared.answers["dry"] = 0
            AnswersManager.shared.answers["combination"] = 1
            AnswersManager.shared.answers["oily"] = 0
            AnswersManager.shared.answers["sensitive"] = 0
            
        } else if answer == "oily" {
            AnswersManager.shared.answers["normal"] = 0
            AnswersManager.shared.answers["dry"] = 0
            AnswersManager.shared.answers["combination"] = 0
            AnswersManager.shared.answers["oily"] = 1
            AnswersManager.shared.answers["sensitive"] = 0
            
        } else if answer == "sensitive" {
            AnswersManager.shared.answers["normal"] = 0
            AnswersManager.shared.answers["dry"] = 0
            AnswersManager.shared.answers["combination"] = 0
            AnswersManager.shared.answers["oily"] = 0
            AnswersManager.shared.answers["sensitive"] = 1
        }
    }
}

