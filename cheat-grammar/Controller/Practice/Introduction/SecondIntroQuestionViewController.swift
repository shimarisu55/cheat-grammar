//
//  SecondIntroQuestionViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/10.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class SecondIntroQuestionViewController: PracticeViewController {
    
    private var introQuestion: QuestionEntity
    
    init(_ introQuestion:QuestionEntity) {
        self.introQuestion = introQuestion
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        practiceFooterView.tapRightButtonVCDelegate = self
        practiceFooterView.tapCenterButtonVCDelegate = self
        setupQuestion()
    }
    
    private func setupQuestion() {
        navigationItem.title = "例題２"
        exampleQuestionView.setupQuiz(quiz:introQuestion.quiz2, theme:introQuestion.theme2, empha:introQuestion.empha2)
        choiceArray = introQuestion.choice2
        answerInt = introQuestion.answer2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        tapCenterButton()
    }
        
}

// MARK: - ボタン　delegate
extension SecondIntroQuestionViewController: TapCenterButtonVCDelegate {
    func tapCenterButton() {
        let commentVC = ExplanationModalViewController(comment: introQuestion.comment2)
        commentVC.dismissExplanationAfter = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.view.alpha = 1
            weakSelf.tapRightButton()
        }
        presentPopver(commentVC: commentVC, sourceView: practiceFooterView)
    }
}

extension SecondIntroQuestionViewController: TapRightButtonVCDelegate {
    func tapRightButton() {
        let nextPageVC = ThirdIntroQuestionViewController(introQuestion)
        navigationController?.pushViewController(nextPageVC, animated: true)
    }
}
