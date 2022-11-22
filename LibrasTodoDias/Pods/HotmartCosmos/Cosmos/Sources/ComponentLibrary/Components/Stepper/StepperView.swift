//
//  StepperView.swift
//  uWallet
//
//  Created by Douglas Seabra Pedrosa on 21/02/22.
//

protocol StepperProtocol: CodedView, Bindable {
    func bindAction(_ externalAction: ((StepperAction) -> Void)?)
}

final class StepperView: UIView, Bindable {
    // MARK: - Properties

    private var currentStepper: StepperProtocol?
    private var action: ((StepperAction) -> Void)?

    // MARK: - Private Methods

    private func addStepperView(_ view: StepperProtocol, withModel model: StepperModel) {
        removeAllSubviews()
        addSubview(view)
        view.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
        view.bindViewModel(model)
        view.bindAction { [weak self] barAction in
            self?.action?(barAction)
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? StepperModel else {
            return
        }

        let stepperView: StepperProtocol
        if case .horizontal = model.style {
            stepperView = StepperHorizontalView()
        } else {
            stepperView = StepperVerticalView()
        }
        currentStepper = stepperView
        addStepperView(stepperView, withModel: model)
    }

    func bindAction(_ externalAction: ((StepperAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}
