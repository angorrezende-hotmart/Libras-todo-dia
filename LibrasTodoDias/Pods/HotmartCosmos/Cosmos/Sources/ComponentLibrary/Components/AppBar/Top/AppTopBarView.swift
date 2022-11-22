//
//  AppTopBarView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 20/05/21.
//

import Foundation

protocol AppTopBarProtocol: ThemedCodedView, Bindable {
    func bindAction(_ externalAction: ((AppTopBarAction) -> Void)?)
}

final class AppTopBarView: ThemedCodedView, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let barHeight: CGFloat = 44.0
    }

    // MARK: - Properties

    private var currentAppBar: AppTopBarProtocol?
    private var action: ((AppTopBarAction) -> Void)?

    // MARK: - View Elements

    private lazy var visualEffectsView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = getBlurStyle()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        return view
    }()

    private let topBarView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(backgroundView)
        addSubview(topBarView)
        backgroundView.addSubview(visualEffectsView)
    }

    override func constrainSubviews() {
        constrainBackgroundView()
        constraintTopBarView()
    }

    // MARK: - Private Properties

    private var model: AppTopBarModel?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        visualEffectsView.effect = getBlurStyle()
        updateBackground()
    }

    // MARK: - Private Methods

    private func getBlurStyle() -> UIBlurEffect {
        let systemTheme = Cosmos.brandLibrary.systemTheme
        let blurStyle: UIBlurEffect.Style

        switch systemTheme {
        case .light:
            blurStyle = .light
        case .dark:
            blurStyle = .dark
        }

        return UIBlurEffect(style: blurStyle)
    }

    private func updateBackground() {
        guard let model = model else { return }

        let systemTheme = Cosmos.brandLibrary.systemTheme

        switch systemTheme {
        case .light:
            visualEffectsView.isHidden = !model.withBlur
            backgroundColor = .clear
        case .dark:
            // Blur does not stay with the same color on dark mode
            // Deactivating until we find a better solution

            visualEffectsView.isHidden = true
            backgroundColor = model.withBlur ? Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color : .clear
        }
    }

    private func constrainBackgroundView() {
        backgroundView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    private func constraintTopBarView() {
        let heightConstraint = topBarView.heightAnchor.constraint(equalToConstant: Constants.barHeight)
        heightConstraint.priority = .defaultHigh

        topBarView.layout(using: [
            heightConstraint,
        ])

        topBarView.anchor(
            top: safeTopAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    // MARK: - Private Methods

    private func addBarView(_ view: AppTopBarProtocol, withModel model: AppTopBarModel) {
        topBarView.addSubview(view)
        view.anchor(
            top: topBarView.topAnchor,
            leading: topBarView.leadingAnchor,
            bottom: topBarView.bottomAnchor,
            trailing: topBarView.trailingAnchor
        )
        view.bindViewModel(model)
        view.bindAction { [weak self] barAction in
            self?.action?(barAction)
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? AppTopBarModel else {
            return
        }

        if self.model?.style != model.style {
            let barView: AppTopBarProtocol

            topBarView.subviews.forEach { $0.removeFromSuperview() }

            switch model.style {
            case .default1,
                 .default1MultipleButtons,
                 .default1MultipleIcons:
                barView = AppTobBarDefault1View()
            case .default2:
                barView = AppTobBarDefault2View()
            case .default3:
                barView = AppTopBarDefault3View()
            case .default4:
                barView = AppTopBarDefault4View()
            }

            currentAppBar = barView
            addBarView(barView, withModel: model)
        } else {
            UIView.animation(withDuration: .blink) { [weak self] in
                self?.currentAppBar?.bindViewModel(model)
                self?.currentAppBar?.bindAction { [weak self] barAction in
                    self?.action?(barAction)
                }
            }
        }

        self.model = model

        updateBackground()
    }

    func bindAction(_ externalAction: ((AppTopBarAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}
