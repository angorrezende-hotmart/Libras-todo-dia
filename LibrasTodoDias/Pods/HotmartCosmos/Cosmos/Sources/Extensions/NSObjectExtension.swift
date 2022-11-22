//
//  NSObjectExtension.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 04/06/21.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: self)
    }
}
