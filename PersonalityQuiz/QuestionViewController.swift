//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Mindy Douglas on 10/29/20.
//

import UIKit

class QuestionViewController: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!
  
  @IBOutlet weak var singleStackView: UIStackView!
  @IBOutlet weak var singleButton1: UIButton!
  @IBOutlet weak var singleButton2: UIButton!
  @IBOutlet weak var singleButton3: UIButton!
  @IBOutlet weak var singleButton4: UIButton!
  @IBOutlet weak var singleButton5: UIButton!
  @IBOutlet weak var singleButton6: UIButton!
  
  @IBOutlet weak var multipleStackView: UIStackView!
  @IBOutlet weak var multiLabel1: UILabel!
  @IBOutlet weak var multiLabel2: UILabel!
  @IBOutlet weak var multiLabel3: UILabel!
  @IBOutlet weak var multiLabel4: UILabel!
  @IBOutlet weak var multiLabel5: UILabel!
  @IBOutlet weak var multiLabel6: UILabel!
  
  @IBOutlet weak var multiSwitch1: UISwitch!
  @IBOutlet weak var multiSwitch2: UISwitch!
  @IBOutlet weak var multiSwitch3: UISwitch!
  @IBOutlet weak var multiSwitch4: UISwitch!
  @IBOutlet weak var multiSwitch5: UISwitch!
  @IBOutlet weak var multiSwitch6: UISwitch!
  
  @IBOutlet weak var rangedStackView: UIStackView!
  @IBOutlet weak var rangedLabel2: UILabel!
  @IBOutlet weak var rangedLabel1: UILabel!
  @IBOutlet weak var rangedSlider: UISlider!
  
  @IBOutlet weak var questionProgressView: UIProgressView!
  
  // initialize an empty collection to store player's answers
  var answersChosen: [Answer] = []
  
  var questionIndex = 0
  
  var questions: [Question] = [
    Question(text: "What is your favorite snack?",
             type: .single,
             answers: [
              Answer(text: "Warm apple pie", type: .applejack),
              Answer(text: "Fresh Fruit", type: .fluttershy),
              Answer(text: "Breakfast food all day", type: .twilightsparkle),
              Answer(text: "Candy & sweets", type: .rainbowdash),
              Answer(text: "Fancy foods like caviar", type: .rarity),
              Answer(text: "Cupcakes!", type: .pinkiepie)
             ]),
    Question(text: "Are you more of a cat person or a dog person?", type: .ranged,
             answers: [
              Answer(text: "Dogs", type: .applejack),
              Answer(text: "Leaning Dog", type: .rainbowdash),
              Answer(text: "Both", type: .fluttershy),
              Answer(text: "Either", type: .pinkiepie),
              Answer(text: "Leaning Cat", type: .twilightsparkle),
              Answer(text: "Cats", type: .rarity)
             ]),
    Question(text: "What are your favorite qualities in a friend?", type: .multiple,
             answers: [
              Answer(text: "generosity", type: .rarity),
              Answer(text: "honesty", type: .applejack),
              Answer(text: "kindness", type: .fluttershy),
              Answer(text: "tries her best", type: .twilightsparkle),
              Answer(text: "loyalty", type: .rainbowdash),
              Answer(text: "makes me laugh", type: .pinkiepie)
             ]),
    Question(text: "How would you prefer to spend a Friday night?",
             type: .single,
             answers: [
              Answer(text: "The life of the party", type: .rarity),
              Answer(text: "Curled up with a good book", type: .twilightsparkle),
              Answer(text: "Making music with my friends", type: .applejack),
              Answer(text: "Quiet night with a close friend", type: .fluttershy),
              Answer(text: "Joking around with my besties", type: .rainbowdash),
              Answer(text: "Party planning and making cupcakes", type: .pinkiepie)
             ])
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    
  }
  
  @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
    let currentAnswers = questions[questionIndex].answers
    
    switch sender {
      case singleButton1:
        answersChosen.append(currentAnswers[0])
      case singleButton2:
        answersChosen.append(currentAnswers[1])
      case singleButton3:
        answersChosen.append(currentAnswers[2])
      case singleButton4:
        answersChosen.append(currentAnswers[3])
      case singleButton5:
        answersChosen.append(currentAnswers[4])
      case singleButton6:
        answersChosen.append(currentAnswers[5])
      default:
        break
    }
    
    nextQuestion()
  }
  
  @IBAction func multipleAnswerButtonPressed() {
    let currentAnswers = questions[questionIndex].answers
    
    if multiSwitch1.isOn {
      answersChosen.append(currentAnswers[0])
    }
    if multiSwitch2.isOn {
      answersChosen.append(currentAnswers[1])
    }
    if multiSwitch3.isOn {
      answersChosen.append(currentAnswers[2])
    }
    if multiSwitch4.isOn {
      answersChosen.append(currentAnswers[3])
    }
    if multiSwitch5.isOn {
      answersChosen.append(currentAnswers[4])
    }
    if multiSwitch6.isOn {
      answersChosen.append(currentAnswers[5])
    }
    
    nextQuestion()
  }
  
  @IBAction func rangedAnswerButtonPressed() {
    let currentAnswers = questions[questionIndex].answers
    
    // multiplies slider value by total number of answers minus one (because index starts at 0) and rounds it
    let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
    
    answersChosen.append(currentAnswers[index])
    
    nextQuestion()
  }
  
  func updateUI() {
    singleStackView.isHidden = true
    multipleStackView.isHidden = true
    rangedStackView.isHidden = true
    
    // assign questionLabel text to current question string; calculate progressView progress by dividing questionIndex by total number 
    
    let currentQuestion = questions[questionIndex]
    let currentAnswers = currentQuestion.answers
    let totalProgress = Float(questionIndex) / Float(questions.count)
    
    navigationItem.title = "Question #\(questionIndex+1)"
    questionLabel.text = currentQuestion.text
    questionProgressView.setProgress(totalProgress, animated: true)
    
    
    switch currentQuestion.type {
      case .single:
        updateSingleStack(using: currentAnswers)
      case .multiple:
        updateMultipleStack(using: currentAnswers)
      case .ranged:
        updateRangedStack(using: currentAnswers)
        
    }
  }
  
  func updateSingleStack(using answers: [Answer]) {
    singleStackView.isHidden = false
    singleButton1.setTitle(answers[0].text, for: .normal)
    singleButton2.setTitle(answers[1].text, for: .normal)
    singleButton3.setTitle(answers[2].text, for: .normal)
    singleButton4.setTitle(answers[3].text, for: .normal)
    singleButton5.setTitle(answers[4].text, for: .normal)
    singleButton6.setTitle(answers[5].text, for: .normal)
  }
  
  func updateMultipleStack(using answers: [Answer]) {
    multipleStackView.isHidden = false
    multiSwitch1.isOn = false
    multiSwitch2.isOn = false
    multiSwitch3.isOn = false
    multiSwitch4.isOn = false
    multiSwitch5.isOn = false
    multiSwitch6.isOn = false
    multiLabel1.text = answers[0].text
    multiLabel2.text = answers[1].text
    multiLabel3.text = answers[2].text
    multiLabel4.text = answers[3].text
    multiLabel5.text = answers[4].text
    multiLabel6.text = answers[5].text
    
  }
  
  func updateRangedStack(using answers: [Answer]) {
    rangedStackView.isHidden = false
    rangedSlider.setValue(0.5, animated: false)
    rangedLabel1.text = answers.first?.text
    rangedLabel2.text = answers.last?.text
  }
  
  func nextQuestion() {
    
    // increment value of questionIndex by 1 and determine if there are any remaining questions.  If so, updateUI() to update title and display the stack view.  If no questions are remaining, present results using segue
    
    questionIndex += 1
    
    if questionIndex < questions.count {
      updateUI()
    } else {
      performSegue(withIdentifier: "ResultsSegue", sender: nil)
    }
  }
  
  
  
  // MARK: - Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ResultsSegue" {
      let resultsViewController = segue.destination as!
        ResultsViewController
      resultsViewController.responses = answersChosen
    }
  }
  
  
  
}
