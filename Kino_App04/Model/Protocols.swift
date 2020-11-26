//
//  Protocols.swift
//  Kino_App03
//
//  Created by jose francisco morales on 21/11/2020.
//

import Foundation


protocol Tab: Hashable {
        func title() -> String
    }

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
