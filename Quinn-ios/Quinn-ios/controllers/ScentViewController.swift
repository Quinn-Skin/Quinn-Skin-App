//
//  ScentViewController.swift
//  Quinn-ios
//
//  Created by Tasha Ip Ying Ler on 11/28/20.
//

import UIKit

class ScentViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    let numberofcell: Int = 4
    
    
    struct Question{
        let id: String
        let text:String
    }
    struct answer{
        
        let text: String
    }
    let question:Question
    let answers: [answer] = [answer(text:"Citrus"),
                             answer(text:"Fresh"),
                             answer(text:"Woodsy"),
                             answer(text:"None")]
    
    @IBOutlet weak var CellLabel: UILabel!
    @IBOutlet weak var ScentCollectionView: UICollectionView!
    var selectedAnswer: answer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScentCollectionView.delegate = self
        ScentCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberofcell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScentCell", for: indexPath) as! ScentCell
        cell.ScentLabel.text = answers[indexPath.row] as? String
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.0, height: 100)
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
