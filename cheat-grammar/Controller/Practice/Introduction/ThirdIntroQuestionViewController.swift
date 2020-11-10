//
//  ThirdIntroQuestionViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/10.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class ThirdIntroQuestionViewController: PracticeViewController {
    
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
        navigationItem.title = "例題３"
        exampleQuestionView.setupQuiz(quiz:introQuestion.quiz3, theme:introQuestion.theme3, empha:introQuestion.empha3)
        choiceArray = introQuestion.choice3
        answerInt = introQuestion.answer3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        tapCenterButton()
    }
        
}

// MARK: - ボタン　delegate
extension ThirdIntroQuestionViewController: TapCenterButtonVCDelegate {
    func tapCenterButton() {
        let commentVC = ExplanationModalViewController(comment: introQuestion.comment3)
        commentVC.dismissExplanationAfter = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.view.alpha = 1
            weakSelf.tapRightButton()
        }
        presentPopver(commentVC: commentVC, sourceView: practiceFooterView)
    }
}

extension ThirdIntroQuestionViewController: TapRightButtonVCDelegate {
    
    func tapRightButton() {
        let nextPageVC = GoalPracticeViewController(introQuestion: introQuestion)
        navigationController?.pushViewController(nextPageVC, animated: true)
    }
    
}
