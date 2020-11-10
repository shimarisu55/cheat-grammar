//
//  Utility.swift
//  cheat-grammar
//
//  Created by 野中志保 on 2020/10/18.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation

class Utility {
    
    // paragraghからtestIdentifer(文字列のみ)を取り出す
    class func cutTestIdentifer(keyword: String) -> String {
        let pattern = "[a-zA-Z]+"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let results = regex.matches(in: keyword, options: [], range: NSRange(0..<keyword.count))
        
        for i in 0..<results[0].numberOfRanges {
            let start = keyword.index(keyword.startIndex, offsetBy: results[0].range(at: i).location)
            let end = keyword.index(start, offsetBy: results[0].range(at: i).length)
            let text = String(keyword[start..<end])
            return text
        }
        return ""
    }
    
    // 履修済みのチェックをつける
    class func saveEndChapter(keyword: String) {
        let userDefaults = UserDefaults.standard
        // まだ保存していなかったら保存する
        if !userDefaults.bool(forKey: keyword) {
            userDefaults.set(true, forKey: keyword)
        }
    }
    
}
