//
//  VerbChapterViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/23.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

enum VerbChapter: String {
    case basicWordFirst   // 基本形(1)
    case basicWordSecond  // 基本形(2)
    case verbColumn       // 活用の行
    case verbType         // 活用の種類
    case verbFormFirst    // 活用系(1)
    case verbFormSecond   // 活用系(2)
    case adjective        // 形容詞
    case adjectival      // 形容動詞
}

class VerbChapterViewController: ChapterBaseViewViewController {
    
    init() {
        super.init(titleArray:
            ["基本形(1)",
             "基本形(2)",
             "活用の行",
             "活用の種類",
             "活用形(1)",
             "活用形(2)",
             "形容詞",
             "形容動詞"],
            testIdentifer:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "用言(動詞・形容詞・形容動詞)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterBaseCell", for: indexPath) as! ChapterBaseTableViewCell
        cell.titleLabel.text = titleArray[indexPath.row]
        
        let iconImage: UIImage
        let testIdentiferString: String
        switch (indexPath.row) {
        case 0:
            testIdentiferString = VerbChapter.basicWordFirst.rawValue
        case 1:
            testIdentiferString = VerbChapter.basicWordSecond.rawValue
        case 2:
            testIdentiferString = VerbChapter.verbColumn.rawValue
        case 3:
            testIdentiferString = VerbChapter.verbType.rawValue
        case 4:
            testIdentiferString = VerbChapter.verbFormFirst.rawValue
        case 5:
            testIdentiferString = VerbChapter.verbFormSecond.rawValue
        case 6:
            testIdentiferString = VerbChapter.verbFormFirst.rawValue
        case 7:
            testIdentiferString = VerbChapter.adjective.rawValue
        default:
            testIdentiferString = VerbChapter.adjectival.rawValue
        }
        // もうすでに履修済みであればチェックマークをつける
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: testIdentiferString) {
            iconImage = UIImage(named: "check-on")!
        } else {
            iconImage = UIImage(named: "check-off")!
        }
        cell.checkIconView.image = iconImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var nextPageVC: ChapterBaseViewViewController
        switch (indexPath.row) {
        case 0:
            nextPageVC = BasicWordFirstViewController(testIdentifer: VerbChapter.basicWordFirst.rawValue)
        case 1:
            nextPageVC = BasicWordSecondViewController(testIdentifer: VerbChapter.basicWordSecond.rawValue)
        case 2:
            nextPageVC = VerbColumnViewController(testIdentifer: VerbChapter.verbColumn.rawValue)
        case 3:
            nextPageVC = VerbTypeViewController(testIdentifer: VerbChapter.verbType.rawValue)
        case 4:
            nextPageVC = VerbFormFirstViewController(testIdentifer: VerbChapter.verbFormFirst.rawValue)
        case 5:
            nextPageVC = VerbFormSecondViewController(testIdentifer: VerbChapter.verbFormSecond.rawValue)
        case 6:
            nextPageVC = AdjectiveViewController(testIdentifer: VerbChapter.adjective.rawValue)
        case 7:
            nextPageVC = AdjectivalViewController(testIdentifer: VerbChapter.adjectival.rawValue)
            
        default:
            nextPageVC = BasicWordFirstViewController(testIdentifer: VerbChapter.basicWordFirst.rawValue)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(nextPageVC, animated: true)
    }

}

