//
//  VerbFormSecondViewController.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/10/18.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class VerbFormSecondViewController: ChapterBaseViewViewController {
    
    init(testIdentifer: String) {
        super.init(titleArray:
            ["上一段活用の活用形",
             "下一段活用の活用形",
             "復習(1)",
             "カ行変格活用の活用形",
             "サ行変格活用の活用形",
             "ナ行変格活用の活用形",
             "ラ行変格活用の活用形",
             "復習(2)",
             "応用問題",
            "チェックテスト"],
            testIdentifer: testIdentifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "活用形(2)"
    }
    
}

