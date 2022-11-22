//
//  BottomSheetHeaderViewCell.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 29/06/21.
//

import Foundation

final class BottomSheetHeaderViewCell: ThemedCodedTableViewCell, Bindable {
    // MARK: - Constants

    private enum Constants {
        static let imageSize: CGFloat = 156.0
        static let titleStackViewSpacing: CGFloat = 2.0
        static let descriptionLabelLines: Int = 0
    }

    // MARK: - Cosmos Components

    private let thumbnailComponent: Component<ThumbnailModel, Void> = Cosmos.makeThumbnail()

    // MARK: - Cosmos Models

    private var thumbnailModel = ThumbnailModel(
        resolution: .res1x1,
        size: .lg,
        accesoryStyle: nil,
        placeholder: nil,
        requestBuilder: nil
    )

    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Spacing().spacing4.value
            $0.distribution = .fill
            $0.alignment = .center
        }.build()

        return stackView
    }()

    private lazy var thumbnailView: UIView = {
        thumbnailComponent.update(thumbnailModel)
        return thumbnailComponent.view()
    }()

    private let titleStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.spacing = Constants.titleStackViewSpacing
            $0.distribution = .fill
            $0.alignment = .center
        }.build()

        return stackView
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = Cosmos.typography.bodyStrong.text3Strong.font
        view.numberOfLines = .zero
        view.textAlignment = .center
        return view
    }()

    private let subtitleLabel: UILabel = {
        let view = UILabel()
        view.font = Cosmos.typography.body.text2.font
        view.numberOfLines = .zero
        view.textAlignment = .center
        return view
    }()

    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = Cosmos.typography.body.text2.font
        view.numberOfLines = Constants.descriptionLabelLines
        view.textAlignment = .center
        return view
    }()

    // MARK: - Coded View

    override func addSubviews() {
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)

        mainStackView.addArrangedSubview(thumbnailView)
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(descriptionLabel)

        addSubview(mainStackView)
    }

    override func constrainSubviews() {
        mainStackView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            leadingConstant: Spacing().spacing6.value,
            bottomConstant: Spacing().spacing6.value,
            trailingConstant: Spacing().spacing6.value
        )
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        backgroundColor = Cosmos.colors.productColors.neutralProductColor.backgroundPrimary.color

        titleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
        subtitleLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral600.color
        descriptionLabel.textColor = Cosmos.colors.productColors.neutralProductColor.neutral900.color
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? BottomSheetHeaderViewModel else {
            return
        }

        thumbnailModel.placeholder = model.image
        thumbnailComponent.update(thumbnailModel)
        thumbnailView.isHidden = model.image == nil

        titleLabel.text = model.title

        subtitleLabel.text = model.subtitle
        subtitleLabel.isHidden = model.subtitle == nil

        descriptionLabel.renderAsHTML(
            model.description ?? "",
            with: Cosmos.typography.body.text2.font,
            color: Cosmos.colors.productColors.neutralProductColor.neutral900,
            andTextAlignment: model.style == .centered ? .center : .left
        )
        descriptionLabel.isHidden = model.description == nil

        if let titleFont = model.titleFont {
            titleLabel.font = titleFont.font
        }

        switch model.style {
        case .centered:
            titleStackView.alignment = .center
            mainStackView.alignment = .center
        case .leading:
            titleStackView.alignment = .leading
            mainStackView.alignment = .leading
        }
    }
}
