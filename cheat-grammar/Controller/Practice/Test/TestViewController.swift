//
//  TestViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/12.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class TestViewController: PracticeViewController {
    
    private var testQuizArray: [TestQuizEntity]
    private var maxQuizCount: Int
    private var problemNo = 0
    private var textQuiz: TestQuizEntity
    var testScore = 0
    var missQuizArray = [TestQuizEntity]()
    
    init(_ testQuizArray:[TestQuizEntity]) {
        self.testQuizArray = testQuizArray
        self.textQuiz = testQuizArray[0]
        self.maxQuizCount = testQuizArray.count
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        practiceFooterView.tapRightButtonVCDelegate = self
        practiceFooterView.tapCenterButtonVCDelegate = self
        practiceFooterView.hideLeftButton()
        setupQuestion()
    }
    
    private func setupQuestion() {
        navigationItem.title = "\(textQuiz.chapterTitle) 問\(problemNo+1)"
        exampleQuestionView.setupQuiz(quiz:textQuiz.quiz, theme:textQuiz.theme, empha:textQuiz.empha)
        choiceArray = textQuiz.choice
        answerInt = textQuiz.answer
        answerView.isHidden = true
        tableView.allowsSelection = true
    }
    
    override func backBarButtonTapped(_ sender: UIBarButtonItem) {
        let stopOnTheWaytext = UIViewController.ErrorMassage.stopUnFinishedTest
        let handler = {(action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
        }
        takeError(message: stopOnTheWaytext, handler: handler)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        if indexPath.row == answerInt {
            /// あたり→点数加点
            testScore += textQuiz.allocation
        } else {
            /// はずれ→paragraghを間違えた問題Arrayに追加
            missQuizArray.append(textQuiz)
        }
        disprayExplanation()
    }
        
}

// MARK: - ボタン　delegate
extension TestViewController: TapCenterButtonVCDelegate {
    func tapCenterButton() {
        // 解説を見たらハズレ処理
        missQuizArray.append(textQuiz)
        tableView.allowsSelection = false
        disprayExplanation()
    }
    
    private func disprayExplanation() {
        let commentVC = ExplanationModalViewController(comment: textQuiz.comment)
        commentVC.dismissExplanationAfter = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.view.alpha = 1
            weakSelf.nextQuiz()
        }
        presentPopver(commentVC: commentVC, sourceView: practiceFooterView)
    }
}
extension TestViewController: TapRightButtonVCDelegate {
    func tapRightButton() {
        // 外れの対応をして次へ
        missQuizArray.append(textQuiz)
        nextQuiz()
    }
    
    private func nextQuiz() {
        problemNo += 1
        if problemNo == maxQuizCount {
            let nextPageVC = ResultTestViewController(naviTitle:textQuiz.chapterTitle, testIdentifer:textQuiz.testIdentifer)
            nextPageVC.testScore = testScore
            // 100点の場合、空のmissQuizArray空のの代わりにtestQuizArrayを詰める
            if missQuizArray.count == 0 {
                nextPageVC.missQuizArray = testQuizArray
            } else {
                nextPageVC.missQuizArray = missQuizArray
            }
            navigationController?.pushViewController(nextPageVC, animated: true)
            return
        }
        textQuiz = testQuizArray[problemNo]
        setupQuestion()
        tableView.reloadData()
    }
}
