//
//  PracticeViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {
    
    var answerInt: Int?
    var choiceArray: [String]?
    
    init() {
        super.init(nibName:"PracticeViewController", bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var exampleQuestionView: ExampleQuestionView!
    @IBOutlet weak var answerView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var practiceFooterView: PracticeFooterView!
    @IBOutlet weak var adBannerView: AdBannerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PracticeBaseTableViewCell", bundle: nil), forCellReuseIdentifier: "PracticeBaseCell")
        adBannerView.bannerView.rootViewController = self
        prepareNaviBarItem()
    }
    
    private func prepareNaviBarItem() {
        let backButtonItem = UIBarButtonItem(title: "終了", style: .done, target: self, action: #selector(backBarButtonTapped(_:)))
        navigationItem.leftBarButtonItem = backButtonItem
    }
    
    @objc func backBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

extension PracticeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PracticeBaseCell", for: indexPath) as! PracticeBaseTableViewCell
        cell.titleLabel.text = choiceArray?[indexPath.row]
        return cell
    }
}

/// 答えあわせ
extension PracticeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 答えのview表示
        if indexPath.row == answerInt {
            answerView.image = UIImage(named: "correct")
        } else {
            answerView.image = UIImage(named: "fault")
        }
        answerView.isHidden = false
        tableView.allowsSelection = false
        return
    }
}

/// ポップ表示
extension PracticeViewController: UIPopoverPresentationControllerDelegate {
    
    /// ポップを出す
    func presentPopver(commentVC: UIViewController!, sourceView: UIView!) {
        commentVC.modalPresentationStyle = .popover
        // 解説Viewの大きさ
        commentVC.preferredContentSize = tableView.bounds.size
        
        let popoverController = commentVC.popoverPresentationController
        popoverController?.delegate = self
        // 出す向き(DownはsourceViewの上)
        popoverController?.permittedArrowDirections = .down
        // どこから出た感じにするか
        popoverController?.sourceView = sourceView
        popoverController?.sourceRect = sourceView.bounds
        
        view.alpha = 0.6
        present(commentVC, animated: true, completion: nil)
    }
    
    /// ポップの外をタップしてもポップを閉じないようにする
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return false
    }
    
    // iPhoneで表示させる場合に必要
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
