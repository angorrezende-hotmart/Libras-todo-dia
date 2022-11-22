//
//  HeaderPlatesView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 25/10/21.
//

import Foundation

final class HeaderPlatesView: CodedView, Bindable {
    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .top
        }

        return stackView.build()
    }()

    private lazy var firstPlateView: PlateView = {
        let view = PlateView()
        view.bindAction { [weak self] in
            self?.action?(.tapFirstPlate)
        }
        return view
    }()

    private lazy var secondPlateView: PlateView = {
        let view = PlateView()
        view.bindAction { [weak self] in
            self?.action?(.tapSecondPlate)
        }
        return view
    }()

    private lazy var thirdPlateView: PlateView = {
        let view = PlateView()
        view.bindAction { [weak self] in
            self?.action?(.tapThirdPlate)
        }
        return view
    }()

    private lazy var fourthPlateView: PlateView = {
        let view = PlateView()
        view.bindAction { [weak self] in
            self?.action?(.tapFourthPlate)
        }
        return view
    }()

    // MARK: - Constraints

    private lazy var mainStackViewLeadingConstraint: NSLayoutConstraint = {
        let constraint = mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        return constraint
    }()

    private lazy var mainStackViewTrailingConstraint: NSLayoutConstraint = {
        let constraint = mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        return constraint
    }()

    // MARK: - Properties

    private var action: ((HeaderPlatesAction) -> Void)?

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(firstPlateView)
        mainStackView.addArrangedSubview(secondPlateView)
        mainStackView.addArrangedSubview(thirdPlateView)
        mainStackView.addArrangedSubview(fourthPlateView)
    }

    override func constrainSubviews() {
        mainStackView.anchor(
            top: topAnchor,
            bottom: bottomAnchor
        )

        mainStackView.layout(using: [
            mainStackViewLeadingConstraint,
            mainStackViewTrailingConstraint,
        ])
    }

    // MARK: - Private Methods

    private func configurateSpacing(with system: SystemHeaderPlates) {
        mainStackView.spacing = system.spacing.betweenPlates
        mainStackViewLeadingConstraint.constant = system.spacing.leadingAndTrailing
        mainStackViewTrailingConstraint.constant = -system.spacing.leadingAndTrailing
    }

    private func definePlateVisibility(_ model: HeaderPlatesModel) {
        secondPlateView.isHidden = model.secondPlate == nil
        thirdPlateView.isHidden = model.thirdPlate == nil
        fourthPlateView.isHidden = model.fourthPlate == nil
    }

    private func configurePlates(_ model: HeaderPlatesModel) {
        let system = model.getSystem()

        definePlateVisibility(model)
        firstPlateView.bindData(model.firstPlate, system: system)

        if let secondPlate = model.secondPlate {
            secondPlateView.bindData(secondPlate, system: system)
        }

        if let thirdPlate = model.thirdPlate {
            thirdPlateView.bindData(thirdPlate, system: system)
        }

        if let fourthPlate = model.fourthPlate {
            fourthPlateView.bindData(fourthPlate, system: system)
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? HeaderPlatesModel else {
            return
        }

        let system = model.getSystem()

        configurePlates(model)
        configurateSpacing(with: system)
    }

    func bindAction(_ action: ((HeaderPlatesAction) -> Void)?) {
        self.action = action
    }
}
