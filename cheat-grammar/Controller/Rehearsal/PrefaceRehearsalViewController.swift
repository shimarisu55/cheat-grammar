//
//  PrefaceRehearsalViewController.swift
//  cheat-grammar
//
//  Created by nonakashiho on 2020/11/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

enum RehearsalTitle: String {
    case chigonosorane
    case akutagawa
    case azumakudari
}

final class PrefaceRehearsalViewController: InterludeBaseViewController {
    
    private var testIdentifer: String = ""
    private var testQuizArray: [TestQuizEntity]?
    
    init(testIdentifer: String) {
        self.testIdentifer = testIdentifer
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "チェックテスト"
        callDocuments(testIdentifer)
        exampleQuestionView.isHidden = true
        practiceFooterView.hideCenterButton()
        practiceFooterView.tapLeftButtonVCDelegate = self
        practiceFooterView.tapRightButtonVCDelegate = self
    }
    
    // MARK: - fetchDocuments
    private func callDocuments(_ testIdentifer: String) {
        FirebaseDBFetcher.sharedInstance.fetchRehearsalDocuments(testIdentifer: testIdentifer, completion: { [weak self] (testQuizArray) in
            guard let weakSelf = self else { return }
            if let questionArray = testQuizArray, questionArray.count != 0  {
                weakSelf.chapterTitleLabel.text = "このテストで80点以上とってから次の章に進みましょう。"
                weakSelf.testQuizArray = questionArray
                weakSelf.chapterTitleLabel.text = questionArray[0].chapterTitle
            } else {
                weakSelf.errorCallDocument()
            }
        })
    }

}

// MARK: - ボタン　delegate
extension PrefaceRehearsalViewController: TapLeftButtonVCDelegate {
    func tapLeftButton() {
        dismiss(animated: true, completion: nil)
    }
}
extension PrefaceRehearsalViewController: TapRightButtonVCDelegate {
    func tapRightButton() {
        guard let questionArray = testQuizArray else { return }
        let nextPageVC = TestViewController(questionArray)
        navigationController?.pushViewController(nextPageVC, animated: true)
    }
}
