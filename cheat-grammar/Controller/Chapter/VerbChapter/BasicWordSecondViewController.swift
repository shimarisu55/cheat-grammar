//
//  BasicWordSecondViewController.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/11/06.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class BasicWordSecondViewController: ChapterBaseViewViewController {
    
    init(testIdentifer: String) {
        super.init(titleArray:
            ["上一段活用(1)",
             "上一段活用(2)",
             "下一段活用",
             "カ行変格活用",
             "サ行変格活用",
             "ナ行変格活用",
             "ラ行変格活用",
             "まぎらわしい動詞",
            "チェックテスト"],
            testIdentifer: testIdentifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "基本形(2)"
    }

}


