//
//  SurveyViewController.swift
//  SurveyCollectionView
//
//  Created by Amy W. on 11/23/20.
//

import UIKit

class answerManager {
    static var shared = answerManager()
    var productId : String = ""
    var answers = [
        "label": nil,
        "price" : 30,
        "score" : 4,
        "dry" : 0,
        "combination": 0,
        "normal" : 0,
        "oily" : 0,
        "sensitive" : 0
    ] as [String : Any?]
}

struct Answer{
  let text: String
  var selected: Bool
}

struct Question {
    let text:String
    var answers: [Answer]
}



class TestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
   
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var lastSelectedIndexPath: IndexPath?
//    var selectedAnswer = [IndexPath]()
    var selectedAnswer = [IndexPath]()
  
 
    var surveyModels = [Question]()
    var currentQuestion: Question?
    
    var questionIndex = 0
    
//    var answersDic = [
        
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupQuestions()
//        configureUI(question: surveyModels.first!)
        configureUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        let width = (view.frame.size.width - layout.minimumInteritemSpacing)/2
        layout.itemSize = CGSize(width: width, height: width * 0.5)
    }
    
    func configureUI(){
        let currentQuestion = surveyModels[questionIndex]
//        let currentAnswers = currentQuestion.answers
  
        questionLabel.text = currentQuestion.text
        
    }

    private func setupQuestions(){
        surveyModels.append(Question(text:"What product are you interested in?", answers:[
                                                Answer(text:"Cleanser", selected: false),
                                                Answer(text:"Moisturizer", selected: false),
                                                Answer(text:"Shaving Kits", selected: false),
                                                Answer(text:"Fragrance", selected: false),
                                                Answer(text:"Eye Cream", selected: false),
                                                Answer(text:"Deodorant", selected: false)]))
        
                
                surveyModels.append(Question(text:"What is your skin type?", answers:[
                                                Answer(text:"Dry", selected: false),
                                                Answer(text:"Normal", selected: false),
                                                Answer(text:"Oily", selected: false),
                                                Answer(text:"Sensitive", selected: false),
                                                Answer(text:"Combination", selected: false)]))
                
                
                surveyModels.append(Question(text:"What is your top skin concern?", answers:[
                                                Answer(text:"Dryness", selected: false),
                                                Answer(text:"Acne", selected: false),
                                                Answer(text:"Large pores", selected: false),
                                                Answer(text:"Oily", selected: false),
                                                Answer(text:"Razor bumps", selected: false),
                                                Answer(text:"Aging", selected: false)]))
                
                surveyModels.append(Question(text:"What is your preferred budget?", answers:[
                                                Answer(text:"$25 or less", selected: false),
                                                Answer(text:"$25-50", selected: false),
                                                Answer(text:"Over $50", selected: false)]))
                
                surveyModels.append(Question(text:"What scent do you prefer?" ,answers:[
                                                Answer(text:"Citrus", selected: false),
                                                Answer(text:"Fresh", selected: false),
                                                Answer(text:"Woodsy", selected: false),
                                                Answer(text:"None", selected: false)]))
                
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let currentQuestion = surveyModels[questionIndex]
        return currentQuestion.answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as! TestCell
//        cell.round()
        
        let currentQuestion = surveyModels[questionIndex]
        
//        cell.answerLabel.text = currentQuestion.answers[indexPath.item].text
//        cell.isSelected = (lastSelectedIndexPath == indexPath)
        cell.answerButton.text = currentQuestion.answers[indexPath.item].text

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard lastSelectedIndexPath != indexPath else{
            return
        }
                
        let selectedCell = collectionView.cellForItem(at: indexPath) as! TestCell
        
        selectedCell.isSelected = true
        lastSelectedIndexPath = indexPath
            
        selectedAnswer.append(lastSelectedIndexPath!)
        let getSlecetedAnswer = surveyModels[0].answers[selectedAnswer[selectedAnswer.count - 1][1]].text
        self.updateAnswers(answers: getSlecetedAnswer)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    @IBAction func goNext() {
        if questionIndex < surveyModels.count{
            configureUI()
            newViewController()
        }
    }
    
    
    private func newViewController(){
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let surveyViewController = storyboard.instantiateViewController(identifier: "TestViewController") as! TestViewController
        surveyViewController.questionIndex = self.questionIndex + 1
        self.navigationController?.pushViewController(surveyViewController, animated: true)
      
   
    }
    
//    func toParam() -> [String : Any]{
//        var param : [String : Any] = [:]
//        param["isSelected"] = self.isSelected ? 1:0
//        return param
//
//    }
    
    func modelPredict(){
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
                print(dataString)
                answerManager.shared.productId = dataString
            }
        }
        task.resume()

    }
    
    func updateAnswers(answers: String) -> Void {
        if answers == "Cleanser"  {
            AnswersManager.shared.answers["cleanser"] = 1
            AnswersManager.shared.answers["moisturizer"] = 0
            AnswersManager.shared.answers["shavingKits"] = 0
            AnswersManager.shared.answers["fragrance"] = 0
            AnswersManager.shared.answers["eyeCream"] = 0
            AnswersManager.shared.answers["deodorant"] = 0
            
            print(AnswersManager.shared.answers)
            
        } else  if answers == "Moisturizer"  {
            AnswersManager.shared.answers["cleanser"] = 0
            AnswersManager.shared.answers["moisturizer"] = 1
            AnswersManager.shared.answers["shavingKits"] = 0
            AnswersManager.shared.answers["fragrance"] = 0
            AnswersManager.shared.answers["eyeCream"] = 0
            AnswersManager.shared.answers["deodorant"] = 0
            
            print(AnswersManager.shared.answers)
            
        }  else  if answers == "Shaving Kits"  {
            AnswersManager.shared.answers["cleanser"] = 0
            AnswersManager.shared.answers["moisturizer"] = 0
            AnswersManager.shared.answers["shavingKits"] = 1
            AnswersManager.shared.answers["fragrance"] = 0
            AnswersManager.shared.answers["eyeCream"] = 0
            AnswersManager.shared.answers["deodorant"] = 0
            
            print(AnswersManager.shared.answers)
            
        } else  if answers == "fragrance"  {
            AnswersManager.shared.answers["cleanser"] = 0
            AnswersManager.shared.answers["moisturizer"] = 0
            AnswersManager.shared.answers["shavingKits"] = 0
            AnswersManager.shared.answers["fragrance"] = 1
            AnswersManager.shared.answers["eyeCream"] = 0
            AnswersManager.shared.answers["deodorant"] = 0
            
            print(AnswersManager.shared.answers)
            
            
            
        } else  if answers == "Eye Cream"  {
            AnswersManager.shared.answers["cleanser"] = 0
            AnswersManager.shared.answers["moisturizer"] = 0
            AnswersManager.shared.answers["shavingKits"] = 0
            AnswersManager.shared.answers["fragrance"] =
            AnswersManager.shared.answers["eyeCream"] = 1
            AnswersManager.shared.answers["deodorant"] = 0
            
            print(AnswersManager.shared.answers)
            
        } else  if answers == "Deodorant"  {
            AnswersManager.shared.answers["cleanser"] = 0
            AnswersManager.shared.answers["moisturizer"] = 0
            AnswersManager.shared.answers["shavingKits"] = 0
            AnswersManager.shared.answers["fragrance"] =
            AnswersManager.shared.answers["eyeCream"] = 0
            AnswersManager.shared.answers["deodorant"] = 1
            
            print(AnswersManager.shared.answers)
            
        }
    }
    
}



