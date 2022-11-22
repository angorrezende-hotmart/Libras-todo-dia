//
//  ExpandableLabelView.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 25/10/21.
//

import CoreFoundation

final class TruncatedLabelView: ThemedCodedView, Bindable {
    // MARK: - View Elements

    private lazy var textLabel: UILabel = {
        let view = UILabel()

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()

    // MARK: - Private Properties

    private var action: ((TruncatedLabelAction) -> Void)?
    private var model: TruncatedLabelModel?

    // MARK: - CodedView

    override func addSubviews() {
        addSubview(textLabel)
    }

    override func constrainSubviews() {
        textLabel.fillSuperview()
    }

    // MARK: - ThemedCodedView

    override func configurateColors() {
        textLabel.textColor = model?.textColor?().color
    }

    // MARK: - Life Cycle

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let model = model else {
            return
        }

        updateTextLabelWithExpandText(model: model)
    }

    // MARK: - Internal Methods

    func expand() {
        model?.isCollapsed = false
        UIView.animation(withDuration: .fast) { [weak self] in
            guard let self = self, let model = self.model else { return }
            self.textLabel.numberOfLines = .zero
            self.textLabel.text = model.text
            self.action?(.expand)
        }
    }

    func collapse() {
        model?.isCollapsed = true
        UIView.animation(withDuration: .fast) { [weak self] in
            guard let self = self, let model = self.model else { return }
            self.textLabel.numberOfLines = model.numberOfLinesWhenCollapsed
            self.action?(.collapse)
            self.updateTextLabelWithExpandText(model: model)
        }
    }

    // MARK: - Private Methods

    private func updateTextLabelWithExpandText(model: TruncatedLabelModel) {
        let numberOfChar = numberOfCharactersBeforeTruncating(
            text: model.text,
            font: model.textTypography?.font ?? Cosmos.typography.body.text2.font
        )

        guard numberOfChar != model.text.count else { return }

        let expandText = "... \(model.expandLabelText)"

        let truncatedText: String
        if numberOfChar < expandText.count {
            truncatedText = String(textLabel.text?.prefix(numberOfChar) ?? "")
        } else {
            truncatedText = String(textLabel.text?.prefix(numberOfChar - expandText.count) ?? "")
        }

        let completeStringWithExpandText = "\(truncatedText)\(expandText)"
        let rangeToCustomize = (completeStringWithExpandText as NSString).range(of: model.expandLabelText)

        let attributes: [NSAttributedString.Key: Any] = [
            .font: model.expandLabelTypography?.font ?? Cosmos.typography.bodyStrong.text2Strong.font,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
        ]

        let attributedString = NSMutableAttributedString(string: completeStringWithExpandText)
        attributedString.setAttributes(attributes, range: rangeToCustomize)

        textLabel.attributedText = attributedString
    }

    private func numberOfCharactersBeforeTruncating(text: String, font: UIFont) -> Int {
        guard let fontName = font.fontName as CFString? else { return .zero }
        let ctFont = CTFontCreateWithName(fontName, font.pointSize, nil)

        let attributes: [CFString: Any] = [kCTFontAttributeName: ctFont]
        let attributeString = NSAttributedString(string: text, attributes: attributes as [NSAttributedString.Key: Any])
        let frameSetter = CTFramesetterCreateWithAttributedString(attributeString)

        /// Determines the frame size needed for a string range.
        var fitRange = CFRange()
        CTFramesetterSuggestFrameSizeWithConstraints(
            frameSetter,
            CFRangeMake(CFIndex(Int.zero), CFIndex(Int.zero)),
            nil,
            CGSize(width: textLabel.frame.width, height: textLabel.frame.height),
            &fitRange
        )

        return fitRange.length
    }

    private func handleActionOnlyStyle() {
        action?(.onTapAction)
    }

    private func handleExpandableStyle() {
        model?.isCollapsed == true ? expand() : collapse()
    }

    // MARK: - Actions

    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        switch model?.style {
        case .expandable:
            handleExpandableStyle()
        case .actionOnly:
            handleActionOnlyStyle()
        default:
            break
        }
    }

    // MARK: - Bindable

    func bindViewModel(_ viewModel: CosmosModel) {
        guard let model = viewModel as? TruncatedLabelModel else {
            return
        }

        self.model = model

        textLabel.text = model.text
        textLabel.numberOfLines = model.numberOfLinesWhenCollapsed
        textLabel.font = model.textTypography?.font ?? Cosmos.typography.body.text2.font
        textLabel.textAlignment = model.textAligment
        updateTextLabelWithExpandText(model: model)
    }

    func bindAction(_ action: ((TruncatedLabelAction) -> Void)?) {
        self.action = action
    }
}
