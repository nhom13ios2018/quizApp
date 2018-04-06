//
//  ViewController.swift
//  quizApp
//
//  Created by TH on 4/5/18.
//  Copyright © 2018 TH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["Favorive pet?","Favorite color?","Favorite city?"]
    let answers = [["dog", "cat", "pig"],["yellow", "red", "blue"],["hot Tokyo", "New York", "Manchester"]]
    
    //variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    
    
    
    //label
    
    @IBOutlet weak var lbl: UILabel!
    
    //button
    
    @IBAction func action(_ sender: AnyObject) {
        if (sender.tag == Int(rightAnswerPlacement))
        {
            print("Right!")
        }
        else
        {
            print("Wrong!")
        }
        if(currentQuestion != questions.count){
            newQuestion()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    //Function displays new questions
    func newQuestion() {
        lbl.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        //Create a button
        var button:UIButton = UIButton()
        var x = 1
        for i in 1...3
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if(i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x=2
            }
           
        }
        currentQuestion+=1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

