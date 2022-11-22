import UIKit

/// Defines the pattern for creating a ViewCode based layout
protocol ViewCodeConfigurator {
    /// Where you add all your subviews.
    func addSubviews()
    /// Where you should place your constraint related functions / setup.
    func constrainSubviews()
    /// Where you should update you Cosmos models
//    func updateCosmosComponents()
}

private extension ViewCodeConfigurator {
    func initLayout() {
        addSubviews()
        constrainSubviews()
//        updateCosmosComponents()
    }
}

class CodedView: UIView, ViewCodeConfigurator {
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }

    // MARK: - Layout Setup

    func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }

    func constrainSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }

//    open func updateCosmosComponents() {
//        fatalError("You should override this function in order to setup your CodedView.")
//    }
}

class CodedTableViewCell: UITableViewCell, ViewCodeConfigurator {
    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }

    // MARK: - Layout Setup

    func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }

    func constrainSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
}

class CodedCollectionViewCell: UICollectionViewCell, ViewCodeConfigurator {
    // MARK: - Initialization

    override public init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }

    // MARK: - Layout Setup

    open func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }

    open func constrainSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
}

// Helper class simplify building StackViews
final class StackViewBuilder {
    var axis: NSLayoutConstraint.Axis = .vertical
    var alignment: UIStackView.Alignment = .fill
    var spacing: CGFloat = 0.0
    var distribution: UIStackView.Distribution = .fillProportionally
    var arrangedSubviews: [UIView] = []

    typealias BuilderClosure = (StackViewBuilder) -> Void

    init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }

    func build() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.spacing = spacing
        stackView.distribution = distribution
        return stackView
    }
}

class ThemedCodedView: CodedView {
    // MARK: - View Cycle

    override func layoutSubviews() {
        super.layoutSubviews()
        configurateColors()
    }

    // MARK: - Layout Setup

    func configurateColors() {
        fatalError("You should override this function in order to setup your ThemedCodedView.")
    }
}

class ThemedCodedCollectionViewCell: CodedCollectionViewCell {
    // MARK: - View Cycle

    override func layoutSubviews() {
        super.layoutSubviews()
        configurateColors()
    }

    // MARK: - Layout Setup

    func configurateColors() {
        fatalError("You should override this function in order to setup your ThemedCodedView.")
    }
}

class ThemedCodedTableViewCell: CodedTableViewCell {
    // MARK: - View Cycle

    override open func layoutSubviews() {
        super.layoutSubviews()
        configurateColors()
    }

    // MARK: - Layout Setup

    func configurateColors() {
        fatalError("You should override this function in order to setup your ThemedCodedView.")
    }
}
