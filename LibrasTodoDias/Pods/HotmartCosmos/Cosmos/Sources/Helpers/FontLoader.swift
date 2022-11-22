//
//  FontLoader.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 22/04/21.
//

import Foundation

final class FontLoader {
    static let shared = FontLoader()

    private var loadedFonts: [String: Bool]
    private let internalQueue: DispatchQueue

    lazy var moduleBundle = Bundle.moduleBundle

    private init() {
        loadedFonts = [:]
        internalQueue = DispatchQueue(
            label: "com.hotmart.fontLoader",
            qos: .default,
            attributes: .concurrent
        )
    }

    func loadFont(named: String) {
        let didLoadFont = internalQueue.sync { loadedFonts[named] != nil }
        if didLoadFont == false {
            internalQueue.async(flags: .barrier) { [weak self] in
                self?.loadedFonts[named] = true
            }

            UIFont.registerFont(withFilenameString: named, bundle: moduleBundle)
        }
    }
}
