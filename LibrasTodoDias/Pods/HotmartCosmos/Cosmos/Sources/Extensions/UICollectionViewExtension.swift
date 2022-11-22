//
//  UICollectionViewExtension.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 04/06/21.
//

import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(for type: T.Type) {
        register(type, forCellWithReuseIdentifier: type.className)
    }

    func reusableCell<T: UICollectionViewCell>(for type: T.Type, indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T {
            return cell
        }
        return T()
    }

    func reusableSupplementaryCell<T: UICollectionReusableView>(for type: T.Type, kind: String, indexPath: IndexPath) -> T {
        if let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.className, for: indexPath) as? T {
            return cell
        }
        return T()
    }
}
