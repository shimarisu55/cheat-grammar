//
//  IntroductionViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    private var question: QuestionEntity?
    
    init(question: QuestionEntity) {
        super.init(nibName:"IntroductionViewController", bundle:nil)
        self.question = question
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    @IBOutlet weak private var exampleQuestionView: ExampleQuestionView!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var practiceFooterView: PracticeFooterView!
    @IBOutlet weak var adBannerView: AdBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        practiceFooterView.tapRightButtonVCDelegate = self
        adBannerView.bannerView.rootViewController = self
        setupInfo()
    }
    
    private func setupInfo() {
        guard let introQuestion = question else { return }
        // ナビバー
        navigationItem.hidesBackButton = true
        navigationItem.title = introQuestion.title
        // コンテンツ
        exampleQuestionView.setup(question: introQuestion)
        overViewLabel.text = introQuestion.overview
        // 文字の装飾
        if let empha = introQuestion.empha, introQuestion.overview.contains(empha) {
            overViewLabel.addAccent(emphaKeyword: empha,fontSize:20.0, color: .red)
        }
        // フッター
        practiceFooterView.hideCenterButton()
    }
}

// MARK: - ボタン　delegate
extension IntroductionViewController: TapRightButtonVCDelegate {
    func tapRightButton() {
        guard let introQuestion = question else { return }
        let nextPageVC = FirstIntroQuestionViewController(introQuestion)
        navigationController?.pushViewController(nextPageVC, animated: true)
    }
}
