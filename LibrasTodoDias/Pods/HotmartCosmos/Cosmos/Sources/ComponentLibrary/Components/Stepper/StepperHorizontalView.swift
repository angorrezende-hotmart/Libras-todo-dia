//
//  StepperHorizontalView.swift
//  uWallet
//
//  Created by Douglas Seabra Pedrosa on 22/02/22.
//

final class StepperHorizontalView: CodedView, StepperProtocol {
    private enum Constants {
        static let progressIndicatorSize: CGSize = .init(width: 24, height: 24)
        static let subtitleTopSpace: CGFloat = 2.0
    }

    // MARK: - Properties

    private var viewModel: StepperModel?
    private var action: ((StepperAction) -> Void)?

    // MARK: - View Elements

    private let progressIndicatorContainer: UIView = {
        let view = UIView()
        return view
    }()

    private let progressIndicator: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let progressLineRight: UIView = {
        let view = UIView()
        return view
    }()

    private let progressLineLeft: UIView = {
        let view = UIView()
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(progressIndicatorContainer)
        progressIndicatorContainer.addSubview(progressIndicator)
        progressIndicatorContainer.addSubview(progressLineLeft)
        progressIndicatorContainer.addSubview(progressLineRight)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }

    override func constrainSubviews() {
        constrainProgressIndicatorContainer()
        constrainProgressLineLeft()
        constrainProgressIndicator()
        constrainProgressLineRight()
        constrainTitleLabel()
        constrainsubtitleLabel()
    }

    // MARK: - Constrain Setup

    private func constrainProgressIndicatorContainer() {
        progressIndicatorContainer.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor
        )
    }

    private func constrainProgressLineLeft() {
        progressLineLeft.anchor(
            leading: progressIndicatorContainer.leadingAnchor,
            heightConstant: .one
        )
        progressLineLeft.anchorCenterYToSuperview()
    }

    private func constrainProgressIndicator() {
        progressIndicator.anchor(
            top: progressIndicatorContainer.topAnchor,
            leading: progressLineLeft.trailingAnchor,
            bottom: progressIndicatorContainer.bottomAnchor,
            widthConstant: Constants.progressIndicatorSize.width,
            heightConstant: Constants.progressIndicatorSize.height
        )
        progressIndicator.anchorCenterXToSuperview()
    }

    private func constrainProgressLineRight() {
        progressLineRight.anchor(
            leading: progressIndicator.trailingAnchor,
            trailing: progressIndicatorContainer.trailingAnchor,
            heightConstant: .one
        )

        progressLineRight.anchorCenterYToSuperview()
    }

    private func constrainTitleLabel() {
        titleLabel.anchor(
            top: progressIndicatorContainer.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            topConstant: Spacing().spacing2.value,
            leadingConstant: Spacing().spacing4.value,
            trailingConstant: Spacing().spacing4.value
        )
        titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
    }

    private func constrainsubtitleLabel() {
        subtitleLabel.anchor(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            topConstant: Constants.subtitleTopSpace
        )
    }

    // MARK: - Private Methods

    private func configurateView() {
        guard let model = viewModel else {
            return
        }

        var titleColor: SystemColor = Cosmos.colors.productColors.neutralProductColor.neutral500
        var titleFont: UIFont = Cosmos.typography.body.text0.font
        var subtitleColor: SystemColor = Cosmos.colors.productColors.neutralProductColor.neutral500

        switch model.status {
        case .done:
            progressIndicator.image = .stepperDone
            progressIndicator.tintColor = model.color()
            progressLineRight.backgroundColor = model.color()
            progressLineLeft.backgroundColor = model.color()
        case .current:
            titleColor = Cosmos.colors.productColors.neutralProductColor.neutral900
            titleFont = Cosmos.typography.bodyStrong.text0Strong.font
            subtitleColor = Cosmos.colors.productColors.neutralProductColor.neutral700
            progressIndicator.image = .stepperCurrent
            progressIndicator.tintColor = model.color()
            progressLineRight.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral300.color
            progressLineLeft.backgroundColor = model.color()
        case .next:
            titleColor = Cosmos.colors.productColors.neutralProductColor.neutral400
            titleFont = Cosmos.typography.body.text0.font
            subtitleColor = Cosmos.colors.productColors.neutralProductColor.neutral400
            progressIndicator.image = .stepperNext
            progressIndicator.tintColor = Cosmos.colors.productColors.neutralProductColor.neutral400.color
            progressLineRight.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral300.color
            progressLineLeft.backgroundColor = Cosmos.colors.productColors.neutralProductColor.neutral300.color
        }

        progressLineLeft.isHidden = model.position == .first ? true : false
        progressLineRight.isHidden = model.position == .last ? true : false

        titleLabel.text = model.title
        titleLabel.textColor = titleColor.color
        titleLabel.font = titleFont
        subtitleLabel.renderAsHTML(model.subtitle ?? .empty, with: Cosmos.typography.body.text0.font, color: subtitleColor, andTextAlignment: .center)
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? StepperModel else {
            return
        }
        self.viewModel = model

        configurateView()
    }

    func bindAction(_ externalAction: ((StepperAction) -> Void)?) {
        action = { barAction in
            externalAction?(barAction)
        }
    }
}
