//
//  TagView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

final class TagView: ThemedCodedView, Bindable {
    private let stackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = 9.5
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let textLabel: UILabel = {
        let view = UILabel()
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }()

    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.contentMode = .center
        return view
    }()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        configureView()
    }

    // MARK: - Properties

    private var model: TagModel?
    private var system: SystemTag?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = system, let model = model else { return }
        iconImageView.tintColor = system.textColor.color
        backgroundColor = system.backgroundColor.color

        if case .html = model.textStyle {
            textLabel.renderAsHTML(model.text, with: system.typography.font, color: system.textColor)
        } else {
            textLabel.text = model.text
            textLabel.font = system.typography.font
            textLabel.textColor = system.textColor.color
        }
    }

    // MARK: - CodedView

    override func addSubviews() {
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(textLabel)

        addSubview(stackView)
    }

    override func constrainSubviews() {
        anchor(
            heightConstant: 24
        )

        stackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            leadingConstant: 12,
            trailingConstant: 12
        )
    }

    // MARK: - Private Methods

    private func configureView() {
        layer.cornerRadius = 12
        clipsToBounds = true
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? TagModel else {
            return
        }

        let system = model.getSystem()
        self.system = system
        self.model = model

        iconImageView.isHidden = true
        if let icon = model.icon {
            iconImageView.isHidden = false
            iconImageView.image = Cosmos.iconSet(imageType: icon, size: .small)
        }
        configurateColors()
    }
}
