//
//  UIViewController+Alert.swift
//  chip-grammar
//
//  Created by 野中志保 on 2020/09/28.
//  Copyright © 2020 野中志保. All rights reserved.
//

import Foundation
import UIKit

// どのUIViewControllerでもアラートが出せるように拡張
extension UIViewController {
    
    enum ErrorMassage: String {
        case networkError = "通信エラーです"
        case stopUnFinishedTest = "テストを途中でやめますか？"
        case alertNotReservation = "テスト結果は保存されません。終了しますか？"
    }

    /// エラーパターンを受け取り、エラーメッセージつきのアラートを返す。
    /// - Parameter message: 上のenumで設定したエラーパターン
    func takeError(message: ErrorMassage, handler:((UIAlertAction)->())?) {
        let alert = UIAlertController(title: message.rawValue, message: nil, preferredStyle: .alert)
        let dissolveAlert = UIAlertAction(title: "終了します", style: .default, handler: handler)
        alert.addAction(dissolveAlert)
        if message != .networkError {
            let cancel = UIAlertAction(title: "続けます", style: .default, handler: nil)
            alert.addAction(cancel)
        }
        present(alert, animated: true)
    }
}
