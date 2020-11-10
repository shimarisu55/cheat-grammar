//
//  ChapterBaseViewViewController.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/22.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit


class ChapterBaseViewViewController: UIViewController {
    
    var titleArray = [String]()
    var testIdentifer: String
    var canShowInterstitial = false
    
    @IBOutlet weak var tableView: UITableView!
    
    init(titleArray:[String], testIdentifer:String?) {
        self.titleArray = titleArray
        self.testIdentifer = testIdentifer ?? ""
        super.init(nibName:"ChapterBaseViewViewController", bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ChapterBaseTableViewCell", bundle: nil), forCellReuseIdentifier: "ChapterBaseCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension ChapterBaseViewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterBaseCell", for: indexPath) as! ChapterBaseTableViewCell
        cell.titleLabel.text = titleArray[indexPath.row]
        let iconImage: UIImage
        // もうすでに履修済みであればチェックマークをつける
        let userDefaults = UserDefaults.standard
        if indexPath.row == titleArray.count - 1,
            userDefaults.bool(forKey: testIdentifer) {
            iconImage = UIImage(named: "check-on")!
        } else if userDefaults.bool(forKey: testIdentifer + String(indexPath.row)) {
            iconImage = UIImage(named: "check-on")!
        } else {
            iconImage = UIImage(named: "check-off")!
        }
        cell.checkIconView.image = iconImage
        
        return cell
    }
}

extension ChapterBaseViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let nextPageVC: UIViewController
        // 最後のセルを押せばまとめ問題に移動
        if indexPath.row == titleArray.count - 1 {
            nextPageVC = PrefaceTestViewController(testIdentifer: testIdentifer)
        } else {
            nextPageVC = PrefaceIntroductionViewController(testIdentifer: testIdentifer, problemId: indexPath.row)
        }
        let navigationVC = UINavigationController(rootViewController: nextPageVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true, completion: nil)
    }
}


 
