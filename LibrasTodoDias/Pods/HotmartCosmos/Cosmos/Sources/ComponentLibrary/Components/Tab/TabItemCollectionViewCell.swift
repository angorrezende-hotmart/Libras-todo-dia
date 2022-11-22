//
//  TabItemCollectionViewCell.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 04/06/21.
//

import UIKit

final class TabItemCollectionViewCell: ThemedCodedCollectionViewCell, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let labelHeight: CGFloat = 22
        static let emptySpacing: String = "  "
    }

    // MARK: - View Elements

    private let stackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.spacing = Spacing().spacing2.value
            $0.distribution = .fill
            $0.alignment = .fill
        }.build()

        return stackView
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = Cosmos.typography.body.text2.font
        view.textAlignment = .center
        return view
    }()

    // MARK: - Properties

    private var model: TabItemModel?

    override var isSelected: Bool {
        didSet {
            guard let model = model else { return }
            bindViewModel(model)
        }
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        titleLabel.textColor = isSelected ? Cosmos.colors.productColors.neutralProductColor.neutral900.color : Cosmos.colors.productColors.neutralProductColor.neutral600.color
    }

    // MARK: - CodedCollectionViewCell

    override func addSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
    }

    override func constrainSubviews() {
        stackView.anchor(
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            heightConstant: Constants.labelHeight
        )

        stackView.anchorCenterYToSuperview()
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? TabItemModel else {
            return
        }

        self.model = model

        let attributedTitle = NSMutableAttributedString()

        if let icon = model.icon {
            let attachment = NSTextAttachment()
            attachment.image = icon
            attachment.bounds = CGRect(x: .zero, y: model.iconYPositioning ?? .zero, width: icon.size.width, height: icon.size.height)
            attributedTitle.append(NSAttributedString(attachment: attachment))
            attributedTitle.append(NSAttributedString(string: Constants.emptySpacing))

        } else {
            titleLabel.text = model.title
        }

        attributedTitle.append(NSAttributedString(string: model.title))

        if model.indicator {
            let attachment = NSTextAttachment()
            let icon: IconSet = isSelected ? .expandLess : .expandMore
            attachment.image = Cosmos.iconSet(imageType: icon, size: .small)
            attributedTitle.append(NSAttributedString(string: Constants.emptySpacing))
            attributedTitle.append(NSAttributedString(attachment: attachment))
        }

        titleLabel.attributedText = attributedTitle
    }
}
