//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Mindy Douglas on 10/29/20.
//

import UIKit

class ResultsViewController: UIViewController {
  
  @IBOutlet weak var resultImageView: UIImageView!
  @IBOutlet weak var resultAnswerLabel: UILabel!
  @IBOutlet weak var resultDefinitionLabel: UILabel!
  
  var responses: [Answer]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    calculatePersonalityResult()
    navigationItem.hidesBackButton = true
    
    // Do any additional setup after loading the view.
  }
  
  func calculatePersonalityResult() {
    var frequencyOfAnswers: [PonyType: Int] = [:]
    
    
    let responseTypes = responses.map { $0.type }
    
    for response in responseTypes {
      let newCount: Int
      
      if let oldCount = frequencyOfAnswers[response] {
        newCount = oldCount + 1
      } else {
        newCount = 1
      }
      
      frequencyOfAnswers[response] = newCount
      
    }
    
    let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in
      return pair1.value > pair2.value
    })
    
    let mostCommonAnswer = frequentAnswersSorted.first!.key
    // can be simplified with trailing closure syntax
    // let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
    
    
    resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
    resultDefinitionLabel.text = mostCommonAnswer.definition
    resultImageView.image = UIImage(named: mostCommonAnswer.rawValue)
  }
  
  
  
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


