//
//  AppTopBarModel.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 20/05/21.
//

import Foundation

/// The `menu` property should only be passed
/// to the constructor if `iOS 14.0` is available.
///
/// To provide a fallback implementation for this menu,
/// use the component `onEvent` handler to display
/// an alternative way to show the menu
///
public struct AppTopBarModel: CosmosModel {
    var style: Style
    var showIcon: Bool
    var withBlur: Bool
    var menu: Menu?
    var customLeftIcon: IconSet?
    var customLeftIconTintColor: (() -> SystemColor)?
    var titleCustomFont: SystemTypography?

    public init(
        style: Style,
        showIcon: Bool = false,
        withBlur: Bool = true,
        customLeftIcon: IconSet? = nil,
        customLeftIconTintColor: (() -> SystemColor)? = nil,
        titleCustomFont: SystemTypography? = nil
    ) {
        self.style = style
        self.showIcon = showIcon
        self.withBlur = withBlur
        self.customLeftIcon = customLeftIcon
        self.customLeftIconTintColor = customLeftIconTintColor
        self.titleCustomFont = titleCustomFont
    }

    @available(iOS 14.0, *)
    public init(
        style: Style,
        showIcon: Bool = false,
        withBlur: Bool = true,
        menu: Menu,
        customLeftIcon: IconSet? = nil,
        customLeftIconTintColor: (() -> SystemColor)? = nil,
        titleCustomFont: SystemTypography? = nil
    ) {
        self.init(
            style: style,
            showIcon: showIcon,
            withBlur: withBlur,
            customLeftIcon: customLeftIcon,
            customLeftIconTintColor: customLeftIconTintColor,
            titleCustomFont: titleCustomFont
        )
        self.menu = menu
    }

    public struct Menu {
        let buttonIndex: Int
        let options: [MenuOption]

        public init(buttonIndex: Int, options: [AppTopBarModel.MenuOption]) {
            self.buttonIndex = buttonIndex
            self.options = options
        }
    }

    public struct MenuOption {
        let title: String
        let icon: IconSet
        let action: () -> Void

        public init(title: String, icon: IconSet, action: @escaping (() -> Void)) {
            self.title = title
            self.icon = icon
            self.action = action
        }
    }

    public enum Style: Equatable {
        case default1(title: String?, backButton: String?, rightButton: String?, tintColor: (() -> SystemColor)? = nil, hasSelector: Bool = false)
        case default1MultipleButtons(title: String?, backButton: String?, avatar: AvatarModel.Content?, firstButton: UIImage?, secondButton: UIImage?, thirdButton: UIImage?, tintColor: (() -> SystemColor)? = nil, hasBadge: Bool = false, hasSelector: Bool = false)
        case default1MultipleIcons(title: String?, backButton: String?, avatar: AvatarModel.Content?, firstIcon: IconSet?, secondIcon: IconSet?, thirdIcon: IconSet?, tintColor: () -> SystemColor, titleColor: (() -> SystemColor)? = nil, hasBadge: Bool = false, hasSelector: Bool = false)
        case default2(backButton: String?, rightButton: String)
        case default3(showBackButton: Bool, placeholder: String, cancelButton: String)
        case default4(title: String?, titleImage: Image?, avatar: AvatarModel.Content, firstButton: UIImage?, secondButton: UIImage?, tintColor: (() -> SystemColor)? = nil, withBorder: Bool)

        public static func == (lhs: AppTopBarModel.Style, rhs: AppTopBarModel.Style) -> Bool {
            switch (lhs, rhs) {
            case (.default1, .default1),
                 (.default1MultipleButtons, .default1MultipleButtons),
                 (.default1MultipleIcons, .default1MultipleIcons),
                 (.default2, .default2),
                 (.default3, .default3),
                 (.default4, .default4):
                return true
            default:
                return false
            }
        }
    }

    public enum Image {
        case none
        case URL(imageURL: String, requestBuilder: CosmosMediaRequestBuilding? = nil)
        /// Passing a imageURL will make UIImage act like a placeholder
        case image(_ image: UIImage, imageURL: String? = nil, requestBuilder: CosmosMediaRequestBuilding? = nil)
    }
}

public enum AppTopBarAction: CosmosAction {
    case backButtonTap
    case rightButtonTap
    case barButtonTap(index: Int)
    case logoTap
    case searchTextDidChange(string: String?)
    case cancelSearchButtonTap
    case avatarTap
    case selectorButtonTap
}
