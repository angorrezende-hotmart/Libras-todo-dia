//
//  UITableViewExtension.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 04/06/21.
//

import UIKit

extension UITableView {
    func reloadData(with animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integersIn: 0 ..< numberOfSections), with: animation)
    }

    func registerCell(name: String) {
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }

    func registerCell<T: UITableViewCell>(for type: T.Type) {
        register(type, forCellReuseIdentifier: type.className)
    }

    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard dataSource?.tableView(self, cellForRowAt: indexPath) != nil else {
            return
        }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }

    func reusableCell<T: UITableViewCell>(for identifier: String) -> T {
        if let cell = dequeueReusableCell(withIdentifier: identifier) as? T {
            return cell
        }

        return T()
    }

    func reusableCell<T: UITableViewCell>(for identifier: String, for indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T {
            return cell
        }

        return T()
    }

    func height() -> CGFloat {
        layoutIfNeeded()
        return contentSize.height
    }
}
