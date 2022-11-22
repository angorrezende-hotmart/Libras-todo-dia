//
//  RatingView.swift
//  HotmartCosmos
//
//  Created by Gabriel Lopes Ferreira on 09/06/22.
//

final class RatingComponent: CodedView {
    // MARK: - Constants

    private enum Constants {
        static let startCount: Int = 5
        static let halfValue: Float = 0.5
    }

    // MARK: - ViewComponents

    private let stackView: UIStackView = {
        let stackView = StackViewBuilder {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
        }.build()

        return stackView
    }()

    // MARK: - Private Properties

    private var buttonArray: [UIButton]

    // MARK: - Initialization

    init() {
        buttonArray = []
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Coded View

    override func addSubviews() {
        createButtons()

        buttonArray.forEach {
            stackView.addArrangedSubview($0)
        }

        addSubview(stackView)
    }

    override func constrainSubviews() {
        stackView.fillSuperview()
    }

    // MARK: - Private Methods

    private func createButtons() {
        buttonArray = []
        for _ in .zero ..< Constants.startCount {
            let starButton = UIButton()
            starButton.setImage(Cosmos.iconSet(imageType: .starRate, size: .small), for: .normal)
            starButton.tintColor = Cosmos.colors.productColors.neutralProductColor.neutral300.color
            buttonArray.append(starButton)
        }
    }

    private func configureButton(_ button: UIButton, at index: Int, with rating: Float) {
        let unfilledStar = Cosmos.iconSet(imageType: .starRate, size: .small)
        let halfStar = Cosmos.iconSet(imageType: .starRateHalf, size: .small)
        let filledStar = Cosmos.iconSet(imageType: .starRateFilled, size: .small)

        if Float(index) < rating {
            let isHalfValueRating = rating - Float(index) == Constants.halfValue
            let image = isHalfValueRating ? halfStar : filledStar

            button.setImage(image, for: .normal)
        } else {
            button.setImage(unfilledStar, for: .normal)
        }
    }

    // MARK: - Bind View

    func bind(_ viewModel: ViewModel) {
        for (index, button) in buttonArray.enumerated() {
            configureButton(button, at: index, with: viewModel.rating)
        }
    }
}

// MARK: - ViewModel

extension RatingComponent {
    struct ViewModel {
        let rating: Float
    }
}
