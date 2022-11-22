//
//  CommentModel.swift
//  HotmartCosmos
//
//  Created by Gabriel Lopes Ferreira on 08/06/22.
//

import Foundation

public struct CommentModel: CosmosModel {
    public var avatarImage: AvatarModel.Content
    public var text: String
    public var authorName: String
    public var subtitle: String
    public var style: Style
    public var showLeftTopButton: Bool
    public var state: State
    public var repliesButtonModel: ButtonModel?
    public var viewMoreText: String?
    public var isTextExpanded: Bool
    public var isSelected: Bool
    public var isReplyComment: Bool

    public init(
        avatarImage: AvatarModel.Content,
        text: String,
        authorName: String,
        subtitle: String,
        style: CommentModel.Style,
        showLeftTopButton: Bool = false,
        state: State = .default,
        repliesButtonModel: ButtonModel? = nil,
        viewMoreText: String? = nil,
        isTextExpanded: Bool = true,
        isSelected: Bool = false,
        isReplyComment: Bool = false
    ) {
        self.avatarImage = avatarImage
        self.text = text
        self.authorName = authorName
        self.subtitle = subtitle
        self.style = style
        self.showLeftTopButton = showLeftTopButton
        self.state = state
        self.repliesButtonModel = repliesButtonModel
        self.viewMoreText = viewMoreText
        self.isTextExpanded = isTextExpanded
        self.isSelected = isSelected
        self.isReplyComment = isReplyComment
    }

    public enum Style {
        case base
        case baseActions(firstButtonModel: ButtonModel, secondButtonModel: ButtonModel? = nil, thirdButtonModel: ButtonModel? = nil)
        case baseRating(rating: Float)
    }

    public enum State {
        case `default`
        case loading
        case error
    }
}

public enum CommentAction: CosmosAction {
    case firstButtonTap
    case secondButtonTap
    case thirdButtonTap
    case leftTopButtonTap
    case textTap
    case retryTap
    case showRepliesTap
}
