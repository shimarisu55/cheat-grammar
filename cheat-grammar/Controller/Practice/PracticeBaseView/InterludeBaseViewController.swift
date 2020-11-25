//
//  InterludeBaseViewController.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/10/24.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

class InterludeBaseViewController: UIViewController {

    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var exampleQuestionView: ExampleQuestionView!
    @IBOutlet weak var practiceFooterView: PracticeFooterView!
    @IBOutlet weak var adBannerView: AdBannerView!
    
    init() {
        super.init(nibName:"InterludeBaseViewController", bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adBannerView.bannerView.rootViewController = self
        prepareNaviBarItem()
    }
    
    // 広告のサイズを決める
    override func viewWillTransition(to size: CGSize,
                            with coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransition(to:size, with:coordinator)
      coordinator.animate(alongsideTransition: { [weak self] _ in
        guard let weakSelf = self else { return }
        weakSelf.adBannerView.loadBannerAd(viewFrame: weakSelf.view)
      })
    }
    
    private func prepareNaviBarItem() {
        let closeButtonItem = UIBarButtonItem(title: "終了", style: .done, target: self, action: #selector(closeButtonTapped(_:)))
        navigationItem.leftBarButtonItem = closeButtonItem
    }
    
    @objc func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // 子供VCで使う共通処理
    func errorCallDocument() {
        // 通信エラー
        DispatchQueue.main.async {
            let networkErrortext = UIViewController.ErrorMassage.networkError
            let handler = {(action: UIAlertAction!) in
                self.dismiss(animated: true, completion: nil)
            }
            self.takeError(message: networkErrortext, handler: handler)
        }
    }

}
