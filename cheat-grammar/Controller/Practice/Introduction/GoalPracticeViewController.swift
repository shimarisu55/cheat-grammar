//
//  GoalPracticeViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/26.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Charts

class GoalPracticeViewController: UIViewController {
    
    private var introQuestion: QuestionEntity
    private let keyword: String
//    private var isFirst = true
    private var doesShowInterstitialFlag = false
    private var okCount:Int = 0
    private var ngCount:Int = 0
    
    init(introQuestion: QuestionEntity) {
        self.introQuestion = introQuestion
        self.keyword = introQuestion.paragraph
        super.init(nibName:"GoalPracticeViewController", bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak private var exampleQuestionView: ExampleQuestionView!
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var practiceFooterView: PracticeFooterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        practiceFooterView.tapRightButtonVCDelegate = self
        practiceFooterView.tapLeftButtonVCDelegate = self
        practiceFooterView.hideCenterButton()
        AdManager.interstitial.delegate = self
        doesShowInterstitialFlag = AdManager.sharedInstance.decideIfShowInterstitial()
        setupInfo()
    }
    
    private func setupInfo() {
        navigationItem.hidesBackButton = true
        navigationItem.title = introQuestion.title
        exampleQuestionView.setup(question: introQuestion)
//        practiceFooterView.setLeftButtonText(title: "いいえ")
//        practiceFooterView.setRightButtonText(title: "はい")
        // 課金システムとログイン機能ができるまでグラフ機能は隠す
        pieChartView.isHidden = true
        resetPracticeFooterButton()
    }
    
    /// 1回目のボタンを押したらボタン文言を設定し直す
    private func resetPracticeFooterButton() {
        practiceFooterView.setLeftButtonText(title: "戻る")
        let nextButtonText = doesShowInterstitialFlag ? "次へ(広告付き)" : "次へ"
        practiceFooterView.setRightButtonText(title: nextButtonText)
    }
    
//    // firebaseのDBに向けて投票する
//    private func voteWorkSheet(answer:Bool) {
//        resetPracticeFooterButton()
//        let result = answer ? "OK" : "NG"
//        FirebaseDBFetcher.sharedInstance.setValueDB(keyword:keyword, answer:result)
//        FirebaseDBFetcher.sharedInstance.referWorkSheet(keyword: keyword) { [weak self] snapData in
//            guard let weakSelf = self else { return }
//            guard let snap = snapData else { return }
//            for (_,post) in snap {
//                if let answer = post["answer"], answer == "OK" {
//                    weakSelf.okCount += 1
//                } else {
//                    weakSelf.ngCount += 1
//                }
//            }
//            weakSelf.setupPieChartView(okCount: weakSelf.okCount, ngCount: weakSelf.ngCount)
//        }
//    }
    
    
//    private func setupPieChartView(okCount: Int, ngCount: Int) {
//        pieChartView.centerText = "アプリ全体の回答"
//        let dataEntries = [
//            PieChartDataEntry(value: Double(okCount), label: "解ける！"),
//            PieChartDataEntry(value: Double(ngCount), label: "解けない")
//        ]
//        let dataSet = PieChartDataSet(entries: dataEntries)
//        // グラフの色
//        dataSet.colors = ChartColorTemplates.liberty()
//        // グラフのデータの値の色
//        dataSet.valueTextColor = UIColor.black
//        // グラフのデータのタイトルの色
//        dataSet.entryLabelColor = UIColor.black
//        pieChartView.data = PieChartData(dataSet: dataSet)
//
//        // データを％表示にする
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .percent
//        formatter.maximumFractionDigits = 1
//        formatter.multiplier = 1.0
//        pieChartView.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
//        pieChartView.usePercentValuesEnabled = true
//        pieChartView.legend.enabled = false
//
//        view.addSubview(pieChartView)
//    }
}

// MARK: - ボタン　delegate
extension GoalPracticeViewController: TapLeftButtonVCDelegate {
    func tapLeftButton() {
//        // 1回目はアンケート
//        if isFirst {
//            voteWorkSheet(answer: false)
//            isFirst = false
//            return
//        }
        navigationController?.popViewController(animated: true)
    }
}

extension GoalPracticeViewController: TapRightButtonVCDelegate {
    func tapRightButton() {
//        // 1回目はアンケート
//        if isFirst {
//            voteWorkSheet(answer: true)
//            isFirst = false
//            return
//        }
        
        // 章の終了を記録する
        Utility.saveEndChapter(keyword:introQuestion.paragraph)
        // 最後の例題であればチェックテストに移動する
        if introQuestion.lastQuestion {
            let testIdentifer = Utility.cutTestIdentifer(keyword: introQuestion.paragraph)
            let nextPageVC = PrefaceTestViewController(testIdentifer: testIdentifer)
            navigationController?.pushViewController(nextPageVC, animated: true)
            return
        }
        // 通常は次の例題へ進む
        let targetVC = navigationController?.viewControllers[0] as! PrefaceIntroductionViewController
        targetVC.updateNextContent()
        
        // リロードが終わっていれば広告を表示
        if doesShowInterstitialFlag {
            AdManager.interstitial.present(fromRootViewController: self)
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

// MARK: - 広告
extension GoalPracticeViewController: GADInterstitialDelegate {
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        // 広告を見終わったら次の問題へ
        AdManager.sharedInstance.createAndLoadInterstitial()
        navigationController?.popToRootViewController(animated: true)
    }
}



