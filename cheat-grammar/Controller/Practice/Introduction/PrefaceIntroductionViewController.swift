//
//  PrefaceIntroductionViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/24.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

final class PrefaceIntroductionViewController: InterludeBaseViewController {
    
    private var question: QuestionEntity?
    private var keyword: String
    private let testIdentifer: String
    private var problemId: Int
    
    init(testIdentifer: String, problemId: Int) {
        keyword = testIdentifer + String(problemId)
        self.testIdentifer = testIdentifer
        self.problemId = problemId
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callDocuments(keyword)
        commentLabel.text = "この章の目標は次の問題を解けるようになることです。"
        practiceFooterView.hideCenterButton()
        practiceFooterView.hideLeftButton()
        practiceFooterView.tapRightButtonVCDelegate = self
    }
    
    /// GoalPracticeViewControllerから戻ってきた時専用のメソッド
    func updateNextContent() {
        problemId += 1
        keyword = testIdentifer + String(problemId)
        chapterTitleLabel.text = ""
        exampleQuestionView.resetText()
        callDocuments(keyword)
    }
    
    
    // MARK: - fetchDocuments
    private func callDocuments(_ keyword: String) {
        FirebaseDBFetcher.sharedInstance.fetchIntroductionDocuments(keyword: keyword, completion: { [weak self] (introQuestion) in
            guard let weakSelf = self else { return }
            if let question = introQuestion  {
                weakSelf.question = question
                weakSelf.navigationItem.title = "この章の目標"
                weakSelf.chapterTitleLabel.text = question.title
                weakSelf.exampleQuestionView.setupQuiz(quiz:question.introQuiz, theme:question.introTheme, empha:question.introEmpha)
            } else {
                weakSelf.errorCallDocument()
            }
        })
    }

}

// MARK: - ボタン　delegate
extension PrefaceIntroductionViewController: TapRightButtonVCDelegate {
    func tapRightButton() {
        guard let introQuestion = question else { return }
        let nextPageVC = IntroductionViewController(question: introQuestion)
        navigationController?.pushViewController(nextPageVC, animated: true)
    }
}


