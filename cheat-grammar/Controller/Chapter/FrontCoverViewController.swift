//
//  FrontCoverViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/08/21.
//  Copyright © 2020 野中志保. All rights reserved.
//

import UIKit

enum Chapter: Int {
    case spelling = 0
    case verb
    case auxiliaryVerb
}

final class FrontCoverViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    private let sectionHeaderTitles = ["文法練習", "テスト予想問題"]
    private let introTitleArray =
        ["歴史的仮名遣い",
         "用言(動詞・形容詞・形容動詞)",
         "助動詞"]
    private let rehearsalTitleArray =
        ["児のそらね",
         "芥川",
         "東下り"]
    
    init() {
        super.init(nibName:"FrontCoverViewController", bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RehearsalTableViewCell", bundle: nil), forCellReuseIdentifier: "RehearsalCell")
        navigationItem.title = "Cheat 古典文法"
        
    }
}

    
extension FrontCoverViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaderTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return introTitleArray.count
        default:
            return rehearsalTitleArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaderTitles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RehearsalCell", for: indexPath) as! RehearsalTableViewCell
        switch (indexPath.section) {
        case 0:
            cell.titleLabel.text = introTitleArray[indexPath.row]
            cell.buyButton.isHidden = true
        default:
            cell.titleLabel.text = rehearsalTitleArray[indexPath.row]
        }
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section) {
        case 0:
            var nextPageVC: ChapterBaseViewViewController
            switch (indexPath.row) {
            case Chapter.spelling.rawValue:
                nextPageVC = SpellingViewController(testIdentifer: "formerSpell")
            case Chapter.verb.rawValue:
                nextPageVC = VerbChapterViewController()
            case Chapter.auxiliaryVerb.rawValue:
                nextPageVC = AuxiliaryVerbChapterViewController()
            default:
                nextPageVC = VerbChapterViewController()
            }
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(nextPageVC, animated: true)
            
        default:
            var testIdentifer = ""
            switch indexPath.row {
            case 0:
                testIdentifer = "chigonosorane"
            case 1:
                testIdentifer = "akutagawa"
            case 2:
            testIdentifer = "azumakudari"
            default:
                testIdentifer = ""
            }
            let nextPageVC = PrefaceRehearsalViewController(testIdentifer: testIdentifer)
            let navigationVC = UINavigationController(rootViewController: nextPageVC)
            navigationVC.modalPresentationStyle = .fullScreen
            present(navigationVC, animated: true, completion: nil)
        }
        
        
    }
    
}
    
