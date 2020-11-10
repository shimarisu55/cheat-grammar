//
//  BasicWordFirstViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class BasicWordFirstViewController: ChapterBaseViewViewController {
    
    init(testIdentifer: String) {
        super.init(titleArray:
            ["動詞の基本形",
             "歴史的仮名遣い",
             "歴史的仮名遣い(2)",
             "上二段活用",
             "下二段活用",
             "下二段活用(2)",
            "チェックテスト"],
            testIdentifer: testIdentifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "基本形(1)"
    }

}


