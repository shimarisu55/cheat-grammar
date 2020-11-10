//
//  VerbTypeViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/08.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class VerbTypeViewController: ChapterBaseViewViewController {
    
    init(testIdentifer: String) {
        super.init(titleArray:
            ["活用の種類",
             "四段活用",
             "上二段活用",
             "下二段活用",
             "振り返り",
             "上一段活用",
             "下一段活用",
             "まぎらわしい動詞(1)",
             "まぎらわしい動詞(2)",
            "チェックテスト"],
            testIdentifer: testIdentifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "活用の種類"
    }
    
}

