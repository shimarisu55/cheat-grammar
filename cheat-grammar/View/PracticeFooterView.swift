//
//  PracticeFooterView.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/04.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

protocol TapLeftButtonVCDelegate {
    func tapLeftButton()
}
protocol TapCenterButtonVCDelegate {
    func tapCenterButton()
}
protocol TapRightButtonVCDelegate {
    func tapRightButton()
}

class PracticeFooterView: UIView {
    
    var tapLeftButtonVCDelegate: TapLeftButtonVCDelegate?
    var tapCenterButtonVCDelegate: TapCenterButtonVCDelegate?
    var tapRightButtonVCDelegate: TapRightButtonVCDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        let nib = UINib(nibName: "PracticeFooterView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        addSubview(view)
    }
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func tapLeftButton(_ sender: Any) {
        if let leftDelegate = tapLeftButtonVCDelegate {
            leftDelegate.tapLeftButton()
            return
        }
        guard let parentVC: UIViewController = self.parentViewController() else {
            return
        }
        parentVC.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapCenterButton(_ sender: Any) {
        tapCenterButtonVCDelegate?.tapCenterButton()
    }
    
    @IBAction func tapRightButton(_ sender: Any) {
        tapRightButtonVCDelegate?.tapRightButton()
    }
    
    // MARK: - ボタンの文言変更
    func setLeftButtonText(title: String) {
        leftButton.setTitle(title, for: .normal)
    }
    func setCenterButtonText(title: String) {
        centerButton.setTitle(title, for: .normal)
    }
    
    func setRightButtonText(title: String) {
        rightButton.setTitle(title, for: .normal)
    }
    
    
    // MARK: - ボタンを隠す
    /// 左のボタンを隠す
    func hideLeftButton() {
        leftButton.backgroundColor = .clear
        leftButton.setTitleColor(.clear, for: .normal)
        leftButton.isEnabled = false
    }
    
    /// 解説ボタンを隠す
    func hideCenterButton() {
        centerButton.backgroundColor = .clear
        centerButton.setTitleColor(.clear, for: .normal)
        centerButton.isEnabled = false
    }
    
    /// 次へボタンを隠す
    func hideNextButton() {
        rightButton.backgroundColor = .clear
        rightButton.setTitleColor(.clear, for: .normal)
        rightButton.isEnabled = false
    }
    
    
    
}
