//
//  Cosmos.swift
//  CosmosInterface
//
//  Created by Rafael Lage Moreira Barbosa on 27/04/21.
//

import UIKit

// MARK: -

public protocol Theme: Token {
    var lightBrandLibrary: BrandLibrary { get }
    var darkBrandLibrary: BrandLibrary { get }
    var shadows: SystemShadows { get }
}

public enum CosmosTheme {
    case hotmart
    case sparkle
    case custom(_ theme: Theme)

    func getBrandLibrary() -> BrandLibrary {
        let interfaceStyle: UIUserInterfaceStyle

        if #available(iOS 13.0, *), CosmosStore.shared.allowSystemTheme {
            interfaceStyle = UITraitCollection.current.userInterfaceStyle
        } else {
            interfaceStyle = .light
        }

        switch self {
        case .hotmart:
            switch interfaceStyle {
            case .dark:
                return HotmartProductDarkBrandLibrary()
            default:
                return HotmartProductBrandLibrary()
            }

        case .sparkle:
            switch interfaceStyle {
            case .dark:
                return SparkleDarkBrandLibrary()
            default:
                return SparkleBrandLibrary()
            }
        case let .custom(theme):
            switch interfaceStyle {
            case .dark:
                return theme.darkBrandLibrary
            default:
                return theme.lightBrandLibrary
            }
        }
    }

    func getShadows() -> SystemShadows {
        switch self {
        case .sparkle, .hotmart:
            return SparkleShadows()
        case let .custom(theme):
            return theme.shadows
        }
    }
}

public enum Cosmos {
    // MARK: - Dependencies

    private static var store: CosmosStoreInterface = CosmosStore.shared

    // MARK: - Init

    public static func register<T>(_ arg: CosmosDependency, forMetaType metaType: T.Type) {
        store.register(arg, forMetaType: metaType)
    }

    public static func get<T>(_ arg: T.Type) -> T? {
        store.get(arg)
    }

    public static func setTheme(_ theme: CosmosTheme) {
        CosmosStore.shared.theme = theme
    }

    public static func setAllowSystemTheme(_ allow: Bool) {
        CosmosStore.shared.allowSystemTheme = allow
    }

    public static func setBrandLibrary(_ brandLibrary: BrandLibrary = SparkleBrandLibrary()) {
        CosmosStore.shared.brandLibrary = brandLibrary
    }

    public static var typography: FontFamily {
        brandLibrary.typography
    }

    public static var logo: LogoPrimary {
        brandLibrary.logo
    }

    public static var logoSymbols: LogoSymbols {
        brandLibrary.logoSymbols
    }

    public static var colors: BrandLibraryColors {
        brandLibrary.colors
    }

    public static var brandLibrary: BrandLibrary {
        if CosmosStore.shared.allowSystemTheme {
            return currentTheme.getBrandLibrary()
        } else {
            return CosmosStore.shared.brandLibrary
        }
    }

    public static var currentTheme: CosmosTheme {
        CosmosStore.shared.theme
    }

    // MARK: - Make Cosmos Views

    public static func makeAvatar() -> Component<AvatarModel, AvatarAction> {
        let view = AvatarView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeAttentionBox() -> Component<AttentionBoxModel, AttentionBoxAction> {
        let view = AttentionBoxView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeCard() -> Component<CardModel, CardAction> {
        let view = CardView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeCardOutlined() -> Component<OutlinedCardModel, OutlinedCardAction> {
        let view = OutlinedCardView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeCardDescription() -> Component<CardModel, CardAction> {
        let view = CardDescriptionView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeButton() -> Component<ButtonModel, ButtonAction> {
        let view = ButtonView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeTag() -> Component<TagModel, Void> {
        let view = TagView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { _ in
            // Not used
        }
    }

    public static func makeSectionHeader() -> Component<SectionHeaderModel, SectionHeaderAction> {
        let view = SectionHeaderView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeCardPagePreview() -> Component<CardPagePreviewModel, CardPagePreviewAction> {
        let view = CardPagePreviewView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeListView() -> Component<ListModel, ListAction> {
        let view = ListView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeAppTopBar() -> Component<AppTopBarModel, AppTopBarAction> {
        let view = AppTopBarView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeDivider() -> Component<DividerModel, Void> {
        let view = DividerView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { _ in
            // No action
        }
    }

    public static func makeTabView() -> Component<TabModel, TabAction> {
        let view = TabView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeSwitch() -> Component<SwitchModel, SwitchAction> {
        let view = SwitchView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeListComponentItem() -> Component<ListComponentItemModel, ListComponentItemAction> {
        let view = ListComponentItemView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeTextualContent() -> Component<TextualContentModel, Void> {
        let view = TextualContentView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { _ in
            // No action
        }
    }

    public static func makeThumbnail() -> Component<ThumbnailModel, Void> {
        let view = ThumbnailView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { _ in
            // No action
        }
    }

    public static func makeTextField() -> Component<TextFieldModel, TextFieldAction> {
        let view = TextFieldView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeBoxTextField() -> Component<BoxTextFieldModel, BoxTextFieldAction> {
        let view = BoxTextFieldView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeBottomSheet() -> Component<BottomSheetModel, BottomSheetAction> {
        let botttomShetViewController = BottomSheetViewController()
        botttomShetViewController.modalPresentationStyle = .overFullScreen

        return Component { () -> UIView in
            botttomShetViewController.view
        } viewControllerBuilder: {
            botttomShetViewController
        } update: { model in
            botttomShetViewController.bindViewModel(model)
        } eventBinding: { action in
            botttomShetViewController.bindAction(action)
        }
    }

    public static func makeDialog() -> Component<DialogModel, DialogAction> {
        let dialogViewController = DialogViewController()
        dialogViewController.modalPresentationStyle = .overFullScreen

        return Component { () -> UIView in
            dialogViewController.view
        } viewControllerBuilder: {
            dialogViewController
        } update: { model in
            dialogViewController.bindViewModel(model)
        } eventBinding: { action in
            dialogViewController.bindAction(action)
        }
    }

    public static func makePills() -> Component<PillsModel, PillsAction> {
        let view = PillsView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeToast() -> Component<ToastModel, ToastAction> {
        let view = ToastView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeHeaderPlates() -> Component<HeaderPlatesModel, HeaderPlatesAction> {
        let view = HeaderPlatesView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeHeaderContent() -> Component<HeaderContentModel, HeaderContentActions> {
        let view = HeaderContentView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeEmptyState() -> Component<EmptyStateModel, EmptyStateAction> {
        let view = EmptyStateView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeTruncatedLabel() -> Component<TruncatedLabelModel, TruncatedLabelAction> {
        let view = TruncatedLabelView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeLocalSearch() -> Component<LocalSearchModel, LocalSearchAction> {
        let view = LocalSearchView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makePagination() -> Component<PaginationModel, PaginationAction> {
        let view = PaginationView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeStepper() -> Component<StepperModel, StepperAction> {
        let view = StepperView()

        return Component { () -> UIView in
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    public static func makeComment() -> Component<CommentModel, CommentAction> {
        let view = CommentView()

        return Component {
            view
        } update: { model in
            view.bindViewModel(model)
        } eventBinding: { action in
            view.bindAction(action)
        }
    }

    // MARK: - Maker Controllers

    public static func makeAlertController(model: AlertModel) -> UIAlertController {
        let alertController = AlertController()
        alertController.bindViewModel(model)
        return alertController.makeAlert()
    }

    // MARK: - Helpers

    public static func getUIColorBy(systemColor: SystemColor) -> UIColor? {
        let foundedSystemColor = filterColorInBrandColorsAttributes(systemColor: systemColor)
        return foundedSystemColor?.color
    }

    public static func addShadow(_ shadow: SystemShadow, toView view: UIView) {
        view.layer.shadowColor = shadow.color.cgColor
        view.layer.shadowOpacity = shadow.opacity
        view.layer.shadowOffset = shadow.offset
        view.layer.shadowRadius = shadow.radius
    }

    public static func addShadowOfSize(size: SystemShadowSize, toView view: UIView) {
        let shadows = store.theme.getShadows()
        let shadow: SystemShadow
        switch size {
        case .small:
            shadow = shadows.small
        case .medium:
            shadow = shadows.medium
        case .large:
            shadow = shadows.large
        }

        addShadow(shadow, toView: view)
    }

    private static func filterColorInBrandColorsAttributes(systemColor: SystemColor) -> SystemColor? {
        for brandLibraryColor in Mirror(reflecting: Cosmos.brandLibrary.colors).children {
            let mirroredBrandColors = Mirror(reflecting: brandLibraryColor.value)

            let candidateChild = searchForChild(mirroredBrandColors.children, systemColor: systemColor)
            if let foundedSystemColor = candidateChild?.value as? SystemColor {
                return foundedSystemColor
            }
        }
        return nil
    }

    private static func searchForChild(_ children: Mirror.Children, systemColor: SystemColor) -> Mirror.Child? {
        for child in children {
            if let childSytemColor = child.value as? SystemColor {
                if childSytemColor.tokenName == systemColor.tokenName {
                    return child
                }
            } else {
                let newChild = Mirror(reflecting: child.value)
                let candidateChild = searchForChild(newChild.children, systemColor: systemColor)
                if let foundedChild = candidateChild {
                    return foundedChild
                }
            }
        }
        return nil
    }
}

final class CosmosStore: CosmosStoreInterface {
    static var shared: CosmosStoreInterface = CosmosStore()
    var dependencies = [String: Any]()

    func get<T>(_ arg: T.Type) -> T? {
        let name = String(describing: arg)
        return dependencies[name] as? T
    }

    func register<T>(_ arg: CosmosDependency, forMetaType metaType: T.Type) {
        let name = String(describing: metaType)
        dependencies[name] = arg
    }

    var brandLibrary: BrandLibrary

    var allowSystemTheme: Bool = false

    var theme: CosmosTheme {
        didSet {
            didSetTheme()
        }
    }

    init() {
        theme = .sparkle
        brandLibrary = SparkleBrandLibrary()
    }

    private func didSetTheme() {
        // Handle theme change
    }
}
