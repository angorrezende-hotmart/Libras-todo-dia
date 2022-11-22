//
//  Component.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/04/21.
//

import Foundation

public final class Component<Model, Event> {
    public typealias EventHandler = (Event) -> Void
    public typealias ActionLessEventHandler = () -> Void

    public let view: () -> UIView
    public let viewController: (() -> UIViewController)?
    public let update: (Model) -> Void
    public var onEvent: ((EventHandler?) -> Void)?
    public var onActionLessEvent: ((ActionLessEventHandler?) -> Void)?

    init(
        viewBuilder: @escaping () -> UIView,
        viewControllerBuilder: (() -> UIViewController)? = nil,
        update: @escaping (Model) -> Void,
        eventBinding: ((EventHandler?) -> Void)?
    ) {
        view = viewBuilder
        viewController = viewControllerBuilder
        self.update = update
        onEvent = eventBinding
    }
}
