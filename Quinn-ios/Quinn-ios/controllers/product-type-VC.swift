//
//  SurveyViewController.swift
//  SurveyCollectionView
//
//  Created by Amy W. on 11/23/20.
//
import UIKit

class SurveyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var lastSelectedIndexPath: IndexPath?
    var selectedAnswer = [IndexPath]()
 
    
    let question = "What product are you interested in?"
    let items = ["Cleanser","Moisturizer","Shaving Kits","Fragrance","Eye Cream","Deodorant"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        questionLabel.text = "\(question)"
        
        
        
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//       
//        layout.minimumLineSpacing = 40
//        layout.minimumInteritemSpacing = 40
//        
//        let width = (view.frame.size.width - 2 * layout.minimumInteritemSpacing)/3
//        layout.itemSize = CGSize(width: width, height: 3/2)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        cell.answerLabel.text = items[indexPath.item]
       
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.0, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard lastSelectedIndexPath != indexPath else{
            return
        }
        
        collectionView.deselectItem(at: indexPath, animated: true)
//        print(indexPath.item)
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! AnswerCell
        selectedCell.isSelected = true
        lastSelectedIndexPath = indexPath
        selectedAnswer.append(lastSelectedIndexPath!)
        print("\(selectedAnswer)")
        
    }
    
