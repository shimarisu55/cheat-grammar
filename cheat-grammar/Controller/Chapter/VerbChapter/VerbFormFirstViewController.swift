//
//  VerbFormViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/11.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class VerbFormFirstViewController: ChapterBaseViewViewController {
    
    init(testIdentifer: String) {
        super.init(titleArray:
            ["活用形とは",
             "活用形の判別",
             "活用表",
             "活用形",
             "四段活用の活用形",
             "上二段活用の活用形",
             "下二段活用の活用形",
             "復習",
            "チェックテスト"],
            testIdentifer: testIdentifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "活用形(1)"
    }
    
}

