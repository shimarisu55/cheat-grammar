//
//  SpellingViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/23.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class SpellingViewController: ChapterBaseViewViewController {
    
    init(testIdentifer: String) {
        super.init(titleArray:
            ["「む」の発音",
             "古文のハ行",
             "古文のワ行",
             "「くゎ」「ぐゎ」の発音",
             "二重母音(1)",
             "二重母音(2)",
             "二重母音(3)",
            "チェックテスト"],
            testIdentifer: testIdentifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "歴史的仮名遣い"
    }
    
}

