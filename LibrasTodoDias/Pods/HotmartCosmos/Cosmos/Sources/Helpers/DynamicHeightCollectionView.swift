//
//  DynamicHeightCollectionView.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 04/01/22.
//

import UIKit

final class DynamicHeightCollectionView: UICollectionView {
    override public func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, intrinsicContentSize) {
            invalidateIntrinsicContentSize()
        }
    }

    override public var intrinsicContentSize: CGSize {
        contentSize
    }

    override func reloadData() {
        super.reloadData()
        performBatchUpdates {}
    }
}
