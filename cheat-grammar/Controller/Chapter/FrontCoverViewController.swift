//
//  FrontCoverViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/08/21.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

enum Chapter: Int {
    case Spelling = 0
    case Verb
    case Count
}

class FrontCoverViewController: ChapterBaseViewViewController {
    
    init() {
        super.init(titleArray:
            ["歴史的仮名遣い",
             "用言(動詞・形容詞・形容動詞)"
            ],
            testIdentifer: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cheat 古典文法"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterBaseCell", for: indexPath) as! ChapterBaseTableViewCell
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.checkIconView.isHidden = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var nextPageVC: ChapterBaseViewViewController
        switch (indexPath.row) {
        case Chapter.Spelling.rawValue:
            nextPageVC = SpellingViewController(testIdentifer: "formerSpell")
        case Chapter.Verb.rawValue:
            nextPageVC = VerbChapterViewController()
        default:
            nextPageVC = VerbChapterViewController()
        }
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(nextPageVC, animated: true)
        
    }
}

