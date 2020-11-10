//
//  AdjectivalViewController.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/10/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class AdjectivalViewController: ChapterBaseViewViewController {
    
    init(testIdentifer: String) {
        super.init(titleArray:
            ["現代の形容動詞",
             "古文の形容動詞の基本形",
             "形容動詞の活用の種類",
             "ナリ活用の活用形",
             "タリ活用の活用形",
            "チェックテスト"],
            testIdentifer: testIdentifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "形容動詞"
    }
    
}
