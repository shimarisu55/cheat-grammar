//
//  VerbColumnViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/10/02.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

final class VerbColumnViewController: ChapterBaseViewViewController {
    
    init(testIdentifer: String) {
        super.init(titleArray:
            ["動詞の活用行",
             "上二段・下二段活用の行",
             "上一段・下一段活用の行",
             "カ・サ・ナ・ラ変格活用の行",
             "紛らわしい動詞の行",
             "チェックテスト"],
            testIdentifer: testIdentifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "活用の行"
    }
    

}

