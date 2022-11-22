//
//  TextualContentView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 29/06/21.
//

final class TextualContentView: ThemedCodedView, Bindable {
    // MARK: - View Elements

    private let mainStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .vertical
            $0.distribution = .fill
        }.build()
        return stackView
    }()

    private let titleStackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = Spacing().spacing2.value
        }.build()
        return stackView
    }()

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.5
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        return view
    }()

    private let titleView: UIView = {
        let view = UIView()
        return view
    }()

    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()

    private let verifiedImageView: UIImageView = {
        let view = UIImageView()
        view.image = Cosmos.iconSet(imageType: .ribon, size: .medium)
        view.contentMode = .left
        view.isHidden = true
        return view
    }()

    // MARK: - Properties

    private var system: SystemTextualContent?
    private var descriptionStyle: TextualContentModel.DescriptionStyle?
    private var titleStyle: TextualContentModel.TitleStyle?

    // MARK: - ThemedCodedView

    override func configurateColors() {
        guard let system = system else { return }
        setupLabelVisual(
            titleLabel,
            color: titleStyle?.color?.getSystemColor().color ?? system.titleColor.color,
            font: titleStyle?.typography.getSystemTypography().font ?? system.titleTypography.font
        )

        setupLabelVisual(
            descriptionLabel,
            color: descriptionStyle?.color.getSystemColor().color ?? system.descriptionColor?.color,
            font: descriptionStyle?.typography.getSystemTypography().font ?? system.descriptionTypography?.font
        )
    }

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(descriptionLabel)
        titleStackView.addArrangedSubview(titleView)
        titleStackView.addArrangedSubview(verifiedImageView)
        titleView.addSubview(titleLabel)
    }

    override func constrainSubviews() {
        mainStackView.fillSuperview()
        titleLabel.fillSuperview()
    }

    // MARK: - Private Methods

    private func setupTitleLabel(for model: TextualContentModel) {
        setupLabel(
            titleLabel,
            text: model.title
        )
    }

    private func setupDescriptionLabel(_ description: String?, numberOfLines: Int?) {
        setupLabel(
            descriptionLabel,
            text: description
        )

        descriptionLabel.numberOfLines = numberOfLines ?? .zero
    }

    private func setupLabel(_ label: UILabel, text: String?) {
        label.isHidden = false
        label.text = text
    }

    private func setupLabelVisual(_ label: UILabel, color: UIColor?, font: UIFont?) {
        label.textColor = color
        label.font = font
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? TextualContentModel else {
            return
        }

        let system = model.style.getSystem()
        self.system = system
        titleStyle = model.titleStyle
        setupTitleLabel(for: model)

        switch model.style {
        case let .listDesc2(description, descriptionStyle):
            self.descriptionStyle = descriptionStyle
            setupDescriptionLabel(description, numberOfLines: descriptionStyle?.numberOfLines)
        default:
            descriptionLabel.isHidden = true
        }

        configurateColors()
        verifiedImageView.isHidden = !model.isVerified
    }
}
