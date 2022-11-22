//
//  DynamicHeightTableView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 26/08/21.
//

final class DynamicHeightTableView: UITableView {
    override public func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, intrinsicContentSize) {
            invalidateIntrinsicContentSize()
        }
    }

    override public var intrinsicContentSize: CGSize {
        contentSize
    }
}
