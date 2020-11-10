//
//  ReTestViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/17.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class ReTestViewController: PracticeViewController {

    private var maxQuizCount: Int
    private var problemNo = 0
    private var missTestQuiz: TestQuizEntity
    private var missQuizArray = [TestQuizEntity]()

    init(_ missQuizArray:[TestQuizEntity]) {
        self.missQuizArray = missQuizArray
        self.missTestQuiz = missQuizArray[0]
        self.maxQuizCount = missQuizArray.count
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        practiceFooterView.tapLeftButtonVCDelegate = self
        practiceFooterView.tapRightButtonVCDelegate = self
        practiceFooterView.tapCenterButtonVCDelegate = self
        setupQuestion()
    }

    private func setupQuestion() {
        navigationItem.title = "復習 \(problemNo+1) / \(maxQuizCount)"
        exampleQuestionView.setupQuiz(quiz:missTestQuiz.quiz, theme:missTestQuiz.theme, empha:missTestQuiz.empha)
        choiceArray = missTestQuiz.choice
        answerInt = missTestQuiz.answer
        answerView.isHidden = true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        tapCenterButton()
    }

}

// MARK: - ボタン　delegate
extension ReTestViewController: TapLeftButtonVCDelegate {
    func tapLeftButton() {
        prevQuiz()
    }
    private func prevQuiz() {
        if problemNo == 0 {
            navigationController?.popViewController(animated: true)
            return
        }
        problemNo -= 1
        missTestQuiz = missQuizArray[problemNo]
        setupQuestion()
        tableView.reloadData()
    }
}
extension ReTestViewController: TapCenterButtonVCDelegate {
    func tapCenterButton() {
        let commentVC = ExplanationModalViewController(comment: missTestQuiz.comment)
        commentVC.dismissExplanationAfter = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.view.alpha = 1
        }
        presentPopver(commentVC: commentVC, sourceView: practiceFooterView)
    }
}

extension ReTestViewController: TapRightButtonVCDelegate {
    func tapRightButton() {
        nextQuiz()
    }

    private func nextQuiz() {
        problemNo += 1
        if problemNo == maxQuizCount {
            let nextPageVC = ResultTestViewController(naviTitle:missTestQuiz.chapterTitle, testIdentifer:missTestQuiz.testIdentifer)
            nextPageVC.fromReTestFlag = true
            navigationController?.pushViewController(nextPageVC, animated: true)
            return
        }
        missTestQuiz = missQuizArray[problemNo]
        setupQuestion()
        tableView.reloadData()
    }
}
