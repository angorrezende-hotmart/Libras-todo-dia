//
//  SwitchView.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 22/06/21.
//

import UIKit

final class SwitchView: ThemedCodedView, Bindable {
    // MARK: View Elements

    private lazy var uiSwitch: UISwitch = {
        let view = UISwitch()
        view.addTarget(self, action: #selector(switchDidToggle), for: UIControl.Event.valueChanged)
        return view
    }()

    // MARK: - Properties

    private var action: ((SwitchAction) -> Void)?
    private var system: SystemSwitch?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        uiSwitch.onTintColor = system?.activeColor.color
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(uiSwitch)
    }

    override func constrainSubviews() {
        uiSwitch.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor
        )
    }

    // MARK: - Private Methods

    @objc
    private func switchDidToggle() {
        let isOn = uiSwitch.isOn
        action?(.toggle(isOn: isOn))
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? SwitchModel else {
            return
        }

        let system = model.getSystemSwitch()
        self.system = system

        uiSwitch.isOn = model.isOn
    }

    func bindAction(_ externalAction: ((SwitchAction) -> Void)?) {
        action = { switchAction in
            externalAction?(switchAction)
        }
    }
}
