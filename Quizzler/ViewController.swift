//
//  ViewController.swift
//  Quizzler
//
//  Created by Shadab Khan on 11/23/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestion.list[0]
        questionLabel.text = firstQuestion.questionText
        
        scoreLabel.text = "score :\(score)"
        progressLabel.text = "1"
        
        // nextQuestion()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
                pickedAnswer = true
        }
        else if sender.tag == 2 {
                pickedAnswer = false
        }
        
        
       // checkAnswer()
        
        //questionNumber += 1
       // questionLabel.text = allQuestion.list[questionNumber].questionText
   
        
    func updateUI() {
        scoreLabel.text = "score :\(score)"
        progressLabel.text = "\(questionNumber + 1 )/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    
        func startOver() {
            questionNumber = 0
            score = 0
            nextQuestion()
            
        }
        
    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestion.list[questionNumber].questionText
            updateUI()
        }
        else  {
            scoreLabel.text = "score :\(score)"
            let alert = UIAlertController(title: "Awesome", message: "You have finished the question, Do you want to start over", preferredStyle:.alert)
           
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in startOver()})
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("correct")
            score += 1
            
        }
        else   {
            ProgressHUD.showError("wrong")
            
        }
    }
    
    
    
    
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        
        

    
  }
    
}
