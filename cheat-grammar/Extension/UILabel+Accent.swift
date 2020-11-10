//
//  UILabel+Accent.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/24.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

    /// 対象の文字列に対して、アクセント色を付加する
    ///
    /// - Parameters:
    ///   - pattern: 対象の文字列
    ///   - color: アクセント色
    func addAccent(emphaKeyword: String, fontSize: CGFloat, color: UIColor) {
        // String
        let strings = [attributedText?.string, text].compactMap { $0 }
        guard let string = strings.first else { return }

        // Ranges
        let nsRanges = string.nsRanges(of: emphaKeyword, options: [.literal])
        if nsRanges.count == 0 { return }

        // 装飾追加
        let attributedString = attributedText != nil
            ? NSMutableAttributedString(attributedString: attributedText!)
            : NSMutableAttributedString(string: string)
        
        for nsRange in nsRanges {
            attributedString.addAttributes([
                .font: UIFont.boldSystemFont(ofSize: fontSize),
                .foregroundColor: color,
                .underlineStyle: NSUnderlineStyle.thick.rawValue
            ], range: nsRange)
        }

        // Set
        attributedText = attributedString
    }
}
