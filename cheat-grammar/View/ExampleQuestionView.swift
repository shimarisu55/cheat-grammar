//
//  ExampleQuestionView.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/03.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

class ExampleQuestionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        let nib = UINib(nibName: "ExampleQuestionView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        translateLabel.isHidden = true
        answerStackView.isHidden = true
        addSubview(view)
    }
    
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var translateLabel: UILabel!
    @IBOutlet weak var answerStackView: UIStackView!
    @IBOutlet weak var answerLabel: UILabel!
    
    /// introduction(答えあり)
    func setup(question: QuestionEntity) {
        quizLabel.text = question.introQuiz
        themeLabel.text = question.introTheme
        answerLabel.text = question.introAnswer
        // 文字の装飾
        if let empha = question.introEmpha, question.introTheme.contains(empha) {
            themeLabel.addAccent(emphaKeyword: empha,fontSize:20.0, color: .red)
        }
        translateLabel.text = "現代語訳:\n" + question.introTheme
        translateLabel.isHidden = true
        answerStackView.isHidden = false
    }
    
    /// 練習問題
    func setupQuiz(quiz:String, theme:String, empha:String?) {
        quizLabel.text = quiz
        themeLabel.text = theme
        // 文字の装飾
        if let empha = empha, theme.contains(empha) {
            themeLabel.addAccent(emphaKeyword: empha,fontSize:20.0, color: .red)
        }
        translateLabel.text = "現代語訳:\n" + theme
        translateLabel.isHidden = true
        answerStackView.isHidden = true
    }
    
    /// 白紙に戻す
    func resetText() {
        quizLabel.text = ""
        themeLabel.text = ""
        translateLabel.text = ""
        answerStackView.isHidden = true
        
    }



}
