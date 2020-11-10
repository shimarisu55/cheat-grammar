//
//  AuxiliaryVerbViewController.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/11/03.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

enum AuxiliaryVerbChapter: String {
    case zuKeriKi
    case verbColumn
    case verbType
    case verbFormFirst
    case verbFormSecond
}

class AuxiliaryVerbViewController: ChapterBaseViewViewController {
    
    init() {
        super.init(titleArray:
            ["「ず」「けり」「き」",
             "活用の行",
             "活用の種類",
             "活用形(1)",
             "活用形(2)"],
            testIdentifer:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "助動詞"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterBaseCell", for: indexPath) as! ChapterBaseTableViewCell
        cell.titleLabel.text = titleArray[indexPath.row]
        
        let iconImage: UIImage
        let testIdentiferString: String
        switch (indexPath.row) {
        default:
            testIdentiferString = VerbChapter.verbFormSecond.rawValue
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
        default:
            nextPageVC = BasicWordFirstViewController(testIdentifer: VerbChapter.verbFormSecond.rawValue)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(nextPageVC, animated: true)
    }

}

