//
//  ExplanationModalViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

final class ExplanationModalViewController: UIViewController {
    
    private var comment: String?
    var dismissExplanationAfter: (() -> ())?
    
    init(comment: String) {
        super.init(nibName:"ExplanationModalViewController", bundle:nil)
        self.comment = comment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var commentLabel: UILabel!
    
    @IBAction func tapDismissButton(_ sender: Any) {
        dismiss(animated: true, completion: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.dismissExplanationAfter?()
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentLabel.text = comment
    }
    



}
