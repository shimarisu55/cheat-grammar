//
//  ResultTestViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/17.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit
import StoreKit
import GoogleMobileAds

final class ResultTestViewController: InterludeBaseViewController {
    
    var testScore = 0
    var missQuizArray = [TestQuizEntity?]()
    // 遷移元は復習か、それ以外か
    var fromReTestFlag = false
    private let testIdentifer: String
    private let PASSSCORE = 80
    private var doesShowInterstitialFlag = false
    
    init(naviTitle:String, testIdentifer: String) {
        self.testIdentifer = testIdentifer
        super.init()
        navigationItem.title = naviTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        practiceFooterView.hideCenterButton()
        practiceFooterView.tapLeftButtonVCDelegate = self
        practiceFooterView.tapRightButtonVCDelegate = self
        AdManager.interstitial.delegate = self
        doesShowInterstitialFlag = AdManager.sharedInstance.decideIfShowInterstitial()
        setupInfo()
    }
    
    private func setupInfo() {
        chapterTitleLabel.text = "採点結果"
        exampleQuestionView.isHidden = true
        navigationItem.leftBarButtonItem = nil
        navigationItem.hidesBackButton = true
        practiceFooterView.setLeftButtonText(title: "復習する")
        let nextBuddonText = doesShowInterstitialFlag ? "終了(広告付き)" : "終了"
        practiceFooterView.setRightButtonText(title: nextBuddonText)
        if fromReTestFlag {
            // 2回目以降
            chapterTitleLabel.isHidden = true
            commentLabel.text = "お疲れ様でした。次の章に進みましょう"
            practiceFooterView.hideLeftButton()
            Utility.saveEndChapter(keyword: testIdentifer)
            SKStoreReviewController.requestReview()
        } else {
            // 初回
            setTestScoreComment()
            if testScore >= PASSSCORE {
                Utility.saveEndChapter(keyword: testIdentifer)
            }
        }
    }
    
    private func setTestScoreComment() {
        commentLabel.alpha = 0.0
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font : UIFont.systemFont(ofSize: 22.0)
        ]
        let scoreAttributes: [NSAttributedString.Key: Any] = [
            .font : UIFont.systemFont(ofSize: 60.0)
        ]
        
        let score = NSAttributedString(string: testScore.description, attributes: scoreAttributes)
        let point = NSAttributedString(string: " 点\n\n", attributes: titleAttributes)
        let commentText = testScore >= PASSSCORE ? "よくできました！" : "復習してもう一度挑戦しよう"
        let comment = NSAttributedString(string: commentText, attributes: titleAttributes)
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(score)
        mutableAttributedString.append(point)
        mutableAttributedString.append(comment)
        
        commentLabel.attributedText = mutableAttributedString
        commentLabel.textAlignment = .center
        UIView.animate(withDuration: 2.0, delay: 1.0, options: [.curveEaseIn], animations: {
            self.commentLabel.alpha = 1.0
        }, completion: nil)
    }
}

// MARK: - ボタン　delegate
extension ResultTestViewController: TapLeftButtonVCDelegate {
    func tapLeftButton() {
        let nextPageVC = ReTestViewController(missQuizArray as! [TestQuizEntity])
        navigationController?.pushViewController(nextPageVC, animated: true)
    }
}

extension ResultTestViewController: TapRightButtonVCDelegate {
    func tapRightButton() {
        // リロードが終わっていれば広告を表示
        if doesShowInterstitialFlag {
            AdManager.interstitial.present(fromRootViewController: self)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - 広告
extension ResultTestViewController: GADInterstitialDelegate {

    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        // 広告を見終わったら閉じる
        AdManager.sharedInstance.createAndLoadInterstitial()
        dismiss(animated: true, completion: nil)
    }
}
