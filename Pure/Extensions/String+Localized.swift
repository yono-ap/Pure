//
//  String+Localized.swift
//  Pure
//
//  Created by yoshiyuki ono on 2019/03/23.
//  Copyright © 2019 yono-ap. All rights reserved.
//

import Foundation

/// 国際化
protocol Localized {

    /// Localizable.stringsに定義された端末設定の言語で翻訳した文字列
    var localized: String { get }
}

// MARK: - Localized
extension String: Localized {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }

}
