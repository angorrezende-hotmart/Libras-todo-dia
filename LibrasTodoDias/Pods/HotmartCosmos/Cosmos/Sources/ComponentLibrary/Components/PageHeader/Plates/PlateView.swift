//
//  PlateView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 25/10/21.
//

import Foundation

final class PlateView: ThemedCodedView {
    // MARK: - View Elements

    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        return view
    }()

    private let nameLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()

    // MARK: - Private Properties

    private var data: HeaderPlatesModel.Plate?
    private var system: SystemHeaderPlates?
    private var action: (() -> Void)?

    init() {
        super.init(frame: .zero)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewGestureDidRecognize(_:)))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(iconImageView)
        addSubview(nameLabel)
    }

    override func constrainSubviews() {
        constrainIconImageView()
        constrainNameLabel()
    }

    private func constrainIconImageView() {
        iconImageView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor
        )
    }

    private func constrainNameLabel() {
        nameLabel.anchor(
            top: iconImageView.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing1.value
        )
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = system, let data = data else { return }
        iconImageView.tintColor = system.colors.icon.color
        nameLabel.renderAsHTML(
            data.name,
            with: system.typography.name.font,
            color: system.colors.name,
            andTextAlignment: .center
        )
    }

    // MARK: - Private

    @objc private func viewGestureDidRecognize(_ sender: UITapGestureRecognizer?) {
        action?()
    }

    // MARK: - Public

    func bindData(_ data: HeaderPlatesModel.Plate, system: SystemHeaderPlates) {
        self.system = system
        self.data = data

        iconImageView.image = Cosmos.iconSet(imageType: data.icon, size: system.sizes.icon)
        configurateColors()
    }

    func bindAction(_ action: @escaping () -> Void) {
        self.action = action
    }
}
