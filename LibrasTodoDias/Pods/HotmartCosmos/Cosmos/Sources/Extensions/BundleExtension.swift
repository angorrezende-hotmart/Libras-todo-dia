//
//  BundleExtension.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 01/04/21.
//

import Foundation

private class ModuleBundle {}

extension Bundle {
    static let resourcesBundleName = "Cosmos"

    static var moduleBundle: Bundle {
        let podBundle = Bundle(for: ModuleBundle.self)
        guard
            let bundleURL = podBundle.url(forResource: resourcesBundleName, withExtension: "bundle"),
            let bundle = Bundle(url: bundleURL)
        else { fatalError("bundle not found!") }
        return bundle
    }
}
