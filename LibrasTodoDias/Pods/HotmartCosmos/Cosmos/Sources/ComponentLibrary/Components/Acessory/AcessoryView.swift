//
//  AcessoryView.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

final class AcessoryView: ThemedCodedView {
    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
        }

        return stackView.build()
    }()

    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .center
        return view
    }()

    private let textLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 4
    }

    // MARK: - Properties

    private var system: SystemAcessoryMidia?
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = system else { return }
        backgroundColor = system.backgroundColor.color
        textLabel.font = system.typography?.font
        textLabel.textColor = system.color.color
        iconImageView.tintColor = system.color.color
    }

    override func addSubviews() {
        mainStackView.addArrangedSubview(iconImageView)
        mainStackView.addArrangedSubview(textLabel)

        addSubview(mainStackView)
    }

    override func constrainSubviews() {
        mainStackView.anchor(
            top: topAnchor,
            bottom: bottomAnchor
        )

        let leadingConstraint = mainStackView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: Spacing().spacing2.value
        )

        let trailingConstraint = mainStackView.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: -Spacing().spacing2.value
        )

        mainStackView.layout(using: [
            leadingConstraint,
            trailingConstraint,
        ])

        self.leadingConstraint = leadingConstraint
        self.trailingConstraint = trailingConstraint
    }

    private func defaultLeadingAndTrailingConstants() {
        leadingConstraint?.constant = Spacing().spacing2.value
        trailingConstraint?.constant = -Spacing().spacing2.value
    }

    // MARK: - Internal Methods

    func setMidia(_ midia: AcessoryModel.Midia) {
        let system = midia.system
        self.system = system

        switch midia {
        case let .audio(duration):
            textLabel.text = duration
            iconImageView.image = Cosmos.iconSet(imageType: .audioMic, size: .small)
            textLabel.isHidden = duration == nil
            layer.cornerRadius = 4
            defaultLeadingAndTrailingConstants()
        case let .video(duration):
            textLabel.text = duration
            iconImageView.image = Cosmos.iconSet(imageType: .video, size: .small)
            textLabel.isHidden = duration == nil
            layer.cornerRadius = 4
            defaultLeadingAndTrailingConstants()
        case let .live(text):
            textLabel.text = text
            iconImageView.image = Cosmos.iconSet(imageType: .live, size: .small)
            textLabel.isHidden = text == nil
            layer.cornerRadius = 4
            defaultLeadingAndTrailingConstants()
        case let .text(text):
            textLabel.text = text
            iconImageView.isHidden = true
            textLabel.isHidden = false
            layer.cornerRadius = 4
            defaultLeadingAndTrailingConstants()
        case .circle:
            iconImageView.image = Cosmos.iconSet(imageType: .ok, size: .small)
            textLabel.isHidden = true
            leadingConstraint?.constant = 2
            trailingConstraint?.constant = -2
            layer.cornerRadius = 10
        }
    }
}
