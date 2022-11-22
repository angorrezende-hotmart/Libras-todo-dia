//
//  IconSet.swift
//  HotmartCosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/07/21.
//
// swiftlint:disable force_unwrapping

import Foundation

public extension Cosmos {
    static func iconSet(imageType: IconSet, size: ImageSize) -> UIImage {
        imageType.getIconSet().forSize(size)
    }
}

public enum ImageSize {
    case large
    case medium
    case small
}

protocol IconProtocol {
    func forSize(_ size: ImageSize) -> UIImage
}

public enum IconSet: String, CaseIterable {
    case add
    case admin
    case ads
    case alarm
    case apps
    case archive
    case arrowBack
    case arrowDown
    case arrowForward
    case arrowUp
    case attachment
    case audio
    case audioMic
    case back
    case backward
    case balloonChat
    case bankDebit
    case bankVoucher
    case block
    case calendar
    case card
    case cards
    case changeCamera
    case chartBars
    case chartPie
    case chat
    case checkbox
    case checkboxOn
    case checkCircle
    case chevronLeft
    case chevronRight
    case clear
    case clock
    case close
    case collapseAll
    case config
    case copy
    case crop
    case culinary
    case cupon
    case cut
    case delete
    case design
    case dislike
    case dislikeOn
    case diy
    case download
    case downloaded
    case drag
    case ecology
    case edit
    case education
    case email
    case entrepreneurship
    case error
    case expandAll
    case expandLess
    case expandMore
    case externalLink
    case fashion
    case favorite
    case favoriteOn
    case filter
    case fingerprint
    case flash
    case flashAuto
    case flashOff
    case flip
    case folders
    case foward
    case games
    case hide
    case home
    case humor
    case hybridPayment
    case idioms
    case info
    case interrogation
    case invoice
    case law
    case leave
    case lightbulb
    case like
    case likeOn
    case link
    case literature
    case live
    case mastercard
    case megaphone
    case menu
    case moderator
    case money
    case music
    case next
    case nft
    case notification
    case notificationNews
    case notificationOff
    case ok
    case ordination
    case others
    case overflow
    case overflowVertical
    case owner
    case paste
    case pause
    case paymentSecure
    case pdf
    case personalDevelopment
    case petsAndPlants
    case photo
    case photos
    case pin
    case pinOn
    case pix
    case play
    case points
    case print
    case product
    case productReviewed
    case protected
    case qrCode
    case quiz
    case radioButton
    case radioButtonOn
    case receiveMoney
    case reload
    case ribon
    case rotate
    case science
    case search
    case send
    case sexuality
    case share
    case shoppingBag
    case shoppingCart
    case software
    case spirituality
    case sports
    case starRate
    case starRateFilled
    case starRateHalf
    case subtitle
    case telephone
    case transfer
    case upload
    case upSell
    case user
    case users
    case video
    case visa
    case visibility
    case visibilityOff
    case wallet
    case warning
    case wifi
    case wifiOff
    case write
    case neutralCheckboxOn
    case certificate
    case facebook
    case youtube
    case twitter
    case instagram

    func getIconSet() -> IconProtocol {
        switch self {
        case .add:
            return AddIcon()
        case .archive:
            return ArchiveIcon()
        case .arrowBack:
            return ArrowBackIcon()
        case .arrowDown:
            return ArrowDownIcon()
        case .arrowForward:
            return ArrowForwardIcon()
        case .arrowUp:
            return ArrowUpIcon()
        case .attachment:
            return AttachmentIcon()
        case .audio:
            return AudioIcon()
        case .audioMic:
            return AudioMicIcon()
        case .back:
            return BackIcon()
        case .backward:
            return BackwardIcon()
        case .balloonChat:
            return BalloonChatIcon()
        case .bankDebit:
            return BankDebitIcon()
        case .bankVoucher:
            return BankVoucherIcon()
        case .block:
            return BlockIcon()
        case .calendar:
            return CalendarIcon()
        case .card:
            return CardIcon()
        case .changeCamera:
            return ChangeCameraIcon()
        case .chat:
            return ChatIcon()
        case .checkCircle:
            return CheckCircleIcon()
        case .checkbox:
            return CheckboxIcon()
        case .checkboxOn:
            return CheckboxOnIcon()
        case .chevronLeft:
            return ChevronLeftIcon()
        case .clear:
            return ClearIcon()
        case .clock:
            return ClockIcon()
        case .close:
            return CloseIcon()
        case .config:
            return ConfigIcon()
        case .copy:
            return CopyIcon()
        case .crop:
            return CropIcon()
        case .culinary:
            return CulinaryIcon()
        case .cupon:
            return CuponIcon()
        case .cut:
            return CutIcon()
        case .delete:
            return DeleteIcon()
        case .dislike:
            return DislikeIcon()
        case .dislikeOn:
            return DislikeOnIcon()
        case .download:
            return DownloadIcon()
        case .downloaded:
            return DownloadedIcon()
        case .drag:
            return DragIcon()
        case .error:
            return ErrorIcon()
        case .expandLess:
            return ExpandLessIcon()
        case .expandMore:
            return ExpandMoreIcon()
        case .externalLink:
            return ExternalLinkIcon()
        case .fashion:
            return FashionIcon()
        case .favorite:
            return FavoriteIcon()
        case .favoriteOn:
            return FavoriteOnIcon()
        case .filter:
            return FilterIcon()
        case .fingerprint:
            return FingerprintIcon()
        case .flash:
            return FlashIcon()
        case .flashAuto:
            return FlashAutoIcon()
        case .flashOff:
            return FlashOffIcon()
        case .flip:
            return FlipIcon()
        case .foward:
            return FowardIcon()
        case .games:
            return GamesIcon()
        case .hide:
            return HideIcon()
        case .home:
            return HomeIcon()
        case .humor:
            return HumorIcon()
        case .info:
            return InfoIcon()
        case .interrogation:
            return InterrogationIcon()
        case .invoice:
            return InvoiceIcon()
        case .like:
            return LikeIcon()
        case .likeOn:
            return LikeOnIcon()
        case .link:
            return LinkIcon()
        case .live:
            return LiveIcon()
        case .mastercard:
            return MastercardIcon()
        case .menu:
            return MenuIcon()
        case .money:
            return MoneyIcon()
        case .next:
            return NextIcon()
        case .nft:
            return NftIcon()
        case .notification:
            return NotificationIcon()
        case .notificationNews:
            return NotificationNewsIcon()
        case .ok:
            return OkIcon()
        case .ordination:
            return OrdinationIcon()
        case .paste:
            return PasteIcon()
        case .pause:
            return PauseIcon()
        case .paymentSecure:
            return PaymentSecureIcon()
        case .pdf:
            return PdfIcon()
        case .photo:
            return PhotoIcon()
        case .photos:
            return PhotosIcon()
        case .pin:
            return PinIcon()
        case .pinOn:
            return PinOnIcon()
        case .play:
            return PlayIcon()
        case .print:
            return PrintIcon()
        case .product:
            return ProductIcon()
        case .productReviewed:
            return ProductReviewedIcon()
        case .protected:
            return ProtectedIcon()
        case .qrCode:
            return QrCodeIcon()
        case .radioButton:
            return RadioButtonIcon()
        case .radioButtonOn:
            return RadioButtonOnIcon()
        case .receiveMoney:
            return ReceiveMoneyIcon()
        case .reload:
            return ReloadIcon()
        case .ribon:
            return RibonIcon()
        case .rotate:
            return RotateIcon()
        case .science:
            return ScienceIcon()
        case .search:
            return SearchIcon()
        case .send:
            return SendIcon()
        case .share:
            return ShareIcon()
        case .sports:
            return SportsIcon()
        case .starRate:
            return StarRateIcon()
        case .starRateFilled:
            return StarRateFilledIcon()
        case .starRateHalf:
            return StarRateHalfIcon()
        case .subtitle:
            return SubtitleIcon()
        case .transfer:
            return TransferIcon()
        case .upload:
            return UploadIcon()
        case .user:
            return UserIcon()
        case .video:
            return VideoIcon()
        case .visa:
            return VisaIcon()
        case .visibility:
            return VisibilityIcon()
        case .visibilityOff:
            return VisibilityOffIcon()
        case .wallet:
            return WalletIcon()
        case .warning:
            return WarningIcon()
        case .wifi:
            return WifiIcon()
        case .wifiOff:
            return WifiOffIcon()
        case .write:
            return WriteIcon()
        case .ads:
            return AdsIcon()
        case .alarm:
            return AlarmIcon()
        case .chevronRight:
            return ChevronRightIcon()
        case .collapseAll:
            return CollapseAllIcon()
        case .edit:
            return EditIcon()
        case .email:
            return EmailIcon()
        case .expandAll:
            return ExpandAllIcon()
        case .folders:
            return FoldersIcon()
        case .leave:
            return LeaveIcon()
        case .lightbulb:
            return LightbulbIcon()
        case .notificationOff:
            return NotificationOffIcon()
        case .overflow:
            return OverflowIcon()
        case .overflowVertical:
            return OverflowVerticalIcon()
        case .quiz:
            return QuizIcon()
        case .shoppingBag:
            return ShoppingBagIcon()
        case .shoppingCart:
            return ShoppingCartIcon()
        case .users:
            return UsersIcon()
        case .cards:
            return CardsIcon()
        case .chartBars:
            return ChartBarsIcon()
        case .chartPie:
            return ChartPieIcon()
        case .hybridPayment:
            return HybridPaymentIcon()
        case .megaphone:
            return MegaphoneIcon()
        case .pix:
            return PixIcon()
        case .points:
            return PointsIcon()
        case .telephone:
            return TelephoneIcon()
        case .upSell:
            return UpSellIcon()
        case .admin:
            return AdminIcon()
        case .moderator:
            return ModeratorIcon()
        case .owner:
            return OwnerIcon()
        case .apps:
            return AppsIcon()
        case .design:
            return DesignIcon()
        case .diy:
            return DiyIcon()
        case .ecology:
            return EcologyIcon()
        case .education:
            return EducationIcon()
        case .entrepreneurship:
            return EntrepreneurshipIcon()
        case .idioms:
            return IdiomsIcon()
        case .law:
            return LawIcon()
        case .literature:
            return LiteratureIcon()
        case .music:
            return MusicIcon()
        case .others:
            return OthersIcon()
        case .personalDevelopment:
            return PersonalDevelopmentIcon()
        case .petsAndPlants:
            return PetsAndPlantsIcon()
        case .sexuality:
            return SexualityIcon()
        case .software:
            return SoftwareIcon()
        case .spirituality:
            return SpiritualityIcon()
        case .neutralCheckboxOn:
            return NeutralCheckboxOn()
        case .certificate:
            return Certificate()
        case .facebook:
            return Facebook()
        case .twitter:
            return Twitter()
        case .youtube:
            return Youtube()
        case .instagram:
            return Instagram()
        }
    }

    // MARK: Icon Structs

    private struct AddIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.addLg)!
            case .medium:
                return UIImage(asset: Asset.addMd)!
            case .small:
                return UIImage(asset: Asset.addSm)!
            }
        }
    }

    private struct ArchiveIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.archiveLg)!
            case .medium:
                return UIImage(asset: Asset.archiveMd)!
            case .small:
                return UIImage(asset: Asset.archiveSm)!
            }
        }
    }

    private struct ArrowBackIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.arrowBackLg)!
            case .medium:
                return UIImage(asset: Asset.arrowBackMd)!
            case .small:
                return UIImage(asset: Asset.arrowBackSm)!
            }
        }
    }

    private struct ArrowDownIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.arrowDownLg)!
            case .medium:
                return UIImage(asset: Asset.arrowDownMd)!
            case .small:
                return UIImage(asset: Asset.arrowDownSm)!
            }
        }
    }

    private struct ArrowForwardIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.arrowForwardLg)!
            case .medium:
                return UIImage(asset: Asset.arrowForwardMd)!
            case .small:
                return UIImage(asset: Asset.arrowForwardSm)!
            }
        }
    }

    private struct ArrowUpIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.arrowUpLg)!
            case .medium:
                return UIImage(asset: Asset.arrowUpMd)!
            case .small:
                return UIImage(asset: Asset.arrowUpSm)!
            }
        }
    }

    private struct AttachmentIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.attachmentLg)!
            case .medium:
                return UIImage(asset: Asset.attachmentMd)!
            case .small:
                return UIImage(asset: Asset.attachmentSm)!
            }
        }
    }

    private struct AudioIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.audioLg)!
            case .medium:
                return UIImage(asset: Asset.audioMd)!
            case .small:
                return UIImage(asset: Asset.audioSm)!
            }
        }
    }

    private struct AudioMicIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.audioMicLg)!
            case .medium:
                return UIImage(asset: Asset.audioMicMd)!
            case .small:
                return UIImage(asset: Asset.audioMicSm)!
            }
        }
    }

    private struct BackIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.backLg)!
            case .medium:
                return UIImage(asset: Asset.backMd)!
            case .small:
                return UIImage(asset: Asset.backSm)!
            }
        }
    }

    private struct BackwardIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.backwardLg)!
            case .medium:
                return UIImage(asset: Asset.backwardMd)!
            case .small:
                return UIImage(asset: Asset.backwardSm)!
            }
        }
    }

    private struct BalloonChatIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.balloonChatLg)!
            case .medium:
                return UIImage(asset: Asset.balloonChatMd)!
            case .small:
                return UIImage(asset: Asset.balloonChatSm)!
            }
        }
    }

    private struct BankDebitIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.bankDebitLg)!
            case .medium:
                return UIImage(asset: Asset.bankDebitMd)!
            case .small:
                return UIImage(asset: Asset.bankDebitSm)!
            }
        }
    }

    private struct BankVoucherIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.bankVoucherLg)!
            case .medium:
                return UIImage(asset: Asset.bankVoucherMd)!
            case .small:
                return UIImage(asset: Asset.bankVoucherSm)!
            }
        }
    }

    private struct BlockIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.blockLg)!
            case .medium:
                return UIImage(asset: Asset.blockMd)!
            case .small:
                return UIImage(asset: Asset.blockSm)!
            }
        }
    }

    private struct CalendarIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.calendarLg)!
            case .medium:
                return UIImage(asset: Asset.calendarMd)!
            case .small:
                return UIImage(asset: Asset.calendarSm)!
            }
        }
    }

    private struct CardIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.cardLg)!
            case .medium:
                return UIImage(asset: Asset.cardMd)!
            case .small:
                return UIImage(asset: Asset.cardSm)!
            }
        }
    }

    private struct ChangeCameraIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.changeCameraLg)!
            case .medium:
                return UIImage(asset: Asset.changeCameraMd)!
            case .small:
                return UIImage(asset: Asset.changeCameraSm)!
            }
        }
    }

    private struct ChatIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.chatLg)!
            case .medium:
                return UIImage(asset: Asset.chatMd)!
            case .small:
                return UIImage(asset: Asset.chatSm)!
            }
        }
    }

    private struct CheckCircleIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.checkCircleLg)!
            case .medium:
                return UIImage(asset: Asset.checkCircleMd)!
            case .small:
                return UIImage(asset: Asset.checkCircleSm)!
            }
        }
    }

    private struct CheckboxIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.checkboxLg)!
            case .medium:
                return UIImage(asset: Asset.checkboxMd)!
            case .small:
                return UIImage(asset: Asset.checkboxSm)!
            }
        }
    }

    private struct CheckboxOnIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.checkboxOnLg)!
            case .medium:
                return UIImage(asset: Asset.checkboxOnMd)!
            case .small:
                return UIImage(asset: Asset.checkboxOnSm)!
            }
        }
    }

    private struct ChevronLeftIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.chevronLeftLg)!
            case .medium:
                return UIImage(asset: Asset.chevronLeftMd)!
            case .small:
                return UIImage(asset: Asset.chevronLeftSm)!
            }
        }
    }

    private struct ClearIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.clearLg)!
            case .medium:
                return UIImage(asset: Asset.clearMd)!
            case .small:
                return UIImage(asset: Asset.clearSm)!
            }
        }
    }

    private struct ClockIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.clockLg)!
            case .medium:
                return UIImage(asset: Asset.clockMd)!
            case .small:
                return UIImage(asset: Asset.clockSm)!
            }
        }
    }

    private struct CloseIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.closeLg)!
            case .medium:
                return UIImage(asset: Asset.closeMd)!
            case .small:
                return UIImage(asset: Asset.closeSm)!
            }
        }
    }

    private struct ConfigIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.configLg)!
            case .medium:
                return UIImage(asset: Asset.configMd)!
            case .small:
                return UIImage(asset: Asset.configSm)!
            }
        }
    }

    private struct CopyIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.copyLg)!
            case .medium:
                return UIImage(asset: Asset.copyMd)!
            case .small:
                return UIImage(asset: Asset.copySm)!
            }
        }
    }

    private struct CropIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.cropLg)!
            case .medium:
                return UIImage(asset: Asset.cropMd)!
            case .small:
                return UIImage(asset: Asset.cropSm)!
            }
        }
    }

    private struct CulinaryIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.culinaryLg)!
            case .medium:
                return UIImage(asset: Asset.culinaryMd)!
            case .small:
                return UIImage(asset: Asset.culinarySm)!
            }
        }
    }

    private struct CuponIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.cuponLg)!
            case .medium:
                return UIImage(asset: Asset.cuponMd)!
            case .small:
                return UIImage(asset: Asset.cuponSm)!
            }
        }
    }

    private struct CutIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.cutLg)!
            case .medium:
                return UIImage(asset: Asset.cutMd)!
            case .small:
                return UIImage(asset: Asset.cutSm)!
            }
        }
    }

    private struct DeleteIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.deleteLg)!
            case .medium:
                return UIImage(asset: Asset.deleteMd)!
            case .small:
                return UIImage(asset: Asset.deleteSm)!
            }
        }
    }

    private struct DislikeIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.dislikeLg)!
            case .medium:
                return UIImage(asset: Asset.dislikeMd)!
            case .small:
                return UIImage(asset: Asset.dislikeSm)!
            }
        }
    }

    private struct DislikeOnIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.dislikeOnLg)!
            case .medium:
                return UIImage(asset: Asset.dislikeOnMd)!
            case .small:
                return UIImage(asset: Asset.dislikeOnSm)!
            }
        }
    }

    private struct DownloadIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.downloadLg)!
            case .medium:
                return UIImage(asset: Asset.downloadMd)!
            case .small:
                return UIImage(asset: Asset.downloadSm)!
            }
        }
    }

    private struct DownloadedIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.downloadedLg)!
            case .medium:
                return UIImage(asset: Asset.downloadedMd)!
            case .small:
                return UIImage(asset: Asset.downloadedSm)!
            }
        }
    }

    private struct DragIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.dragLg)!
            case .medium:
                return UIImage(asset: Asset.dragMd)!
            case .small:
                return UIImage(asset: Asset.dragSm)!
            }
        }
    }

    private struct ErrorIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.errorLg)!
            case .medium:
                return UIImage(asset: Asset.errorMd)!
            case .small:
                return UIImage(asset: Asset.errorSm)!
            }
        }
    }

    private struct ExpandLessIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.expandLessLg)!
            case .medium:
                return UIImage(asset: Asset.expandLessMd)!
            case .small:
                return UIImage(asset: Asset.expandLessSm)!
            }
        }
    }

    private struct ExpandMoreIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.expandMoreLg)!
            case .medium:
                return UIImage(asset: Asset.expandMoreMd)!
            case .small:
                return UIImage(asset: Asset.expandMoreSm)!
            }
        }
    }

    private struct ExternalLinkIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.externalLinkLg)!
            case .medium:
                return UIImage(asset: Asset.externalLinkMd)!
            case .small:
                return UIImage(asset: Asset.externalLinkSm)!
            }
        }
    }

    private struct FashionIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.fashionLg)!
            case .medium:
                return UIImage(asset: Asset.fashionMd)!
            case .small:
                return UIImage(asset: Asset.fashionSm)!
            }
        }
    }

    private struct FavoriteIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.favoriteLg)!
            case .medium:
                return UIImage(asset: Asset.favoriteMd)!
            case .small:
                return UIImage(asset: Asset.favoriteSm)!
            }
        }
    }

    private struct FavoriteOnIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.favoriteOnLg)!
            case .medium:
                return UIImage(asset: Asset.favoriteOnMd)!
            case .small:
                return UIImage(asset: Asset.favoriteOnSm)!
            }
        }
    }

    private struct FilterIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.filterLg)!
            case .medium:
                return UIImage(asset: Asset.filterMd)!
            case .small:
                return UIImage(asset: Asset.filterSm)!
            }
        }
    }

    private struct FingerprintIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.fingerprintLg)!
            case .medium:
                return UIImage(asset: Asset.fingerprintMd)!
            case .small:
                return UIImage(asset: Asset.fingerprintSm)!
            }
        }
    }

    private struct FlashIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.flashLg)!
            case .medium:
                return UIImage(asset: Asset.flashMd)!
            case .small:
                return UIImage(asset: Asset.flashSm)!
            }
        }
    }

    private struct FlashAutoIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.flashAutoLg)!
            case .medium:
                return UIImage(asset: Asset.flashAutoMd)!
            case .small:
                return UIImage(asset: Asset.flashAutoSm)!
            }
        }
    }

    private struct FlashOffIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.flashOffLg)!
            case .medium:
                return UIImage(asset: Asset.flashOffMd)!
            case .small:
                return UIImage(asset: Asset.flashOffSm)!
            }
        }
    }

    private struct FlipIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.flipLg)!
            case .medium:
                return UIImage(asset: Asset.flipMd)!
            case .small:
                return UIImage(asset: Asset.flipSm)!
            }
        }
    }

    private struct FowardIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.fowardLg)!
            case .medium:
                return UIImage(asset: Asset.fowardMd)!
            case .small:
                return UIImage(asset: Asset.fowardSm)!
            }
        }
    }

    private struct GamesIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.gamesLg)!
            case .medium:
                return UIImage(asset: Asset.gamesMd)!
            case .small:
                return UIImage(asset: Asset.gamesSm)!
            }
        }
    }

    private struct HideIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.hideLg)!
            case .medium:
                return UIImage(asset: Asset.hideMd)!
            case .small:
                return UIImage(asset: Asset.hideSm)!
            }
        }
    }

    private struct HomeIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.homeLg)!
            case .medium:
                return UIImage(asset: Asset.homeMd)!
            case .small:
                return UIImage(asset: Asset.homeSm)!
            }
        }
    }

    private struct HumorIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.humorLg)!
            case .medium:
                return UIImage(asset: Asset.humorMd)!
            case .small:
                return UIImage(asset: Asset.humorSm)!
            }
        }
    }

    private struct InfoIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.infoLg)!
            case .medium:
                return UIImage(asset: Asset.infoMd)!
            case .small:
                return UIImage(asset: Asset.infoSm)!
            }
        }
    }

    private struct InterrogationIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.interrogationLg)!
            case .medium:
                return UIImage(asset: Asset.interrogationMd)!
            case .small:
                return UIImage(asset: Asset.interrogationSm)!
            }
        }
    }

    private struct InvoiceIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.invoiceLg)!
            case .medium:
                return UIImage(asset: Asset.invoiceMd)!
            case .small:
                return UIImage(asset: Asset.invoiceSm)!
            }
        }
    }

    private struct LikeIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.likeLg)!
            case .medium:
                return UIImage(asset: Asset.likeMd)!
            case .small:
                return UIImage(asset: Asset.likeSm)!
            }
        }
    }

    private struct LikeOnIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.likeOnLg)!
            case .medium:
                return UIImage(asset: Asset.likeOnMd)!
            case .small:
                return UIImage(asset: Asset.likeOnSm)!
            }
        }
    }

    private struct LinkIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.linkLg)!
            case .medium:
                return UIImage(asset: Asset.linkMd)!
            case .small:
                return UIImage(asset: Asset.linkSm)!
            }
        }
    }

    private struct LiveIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.liveLg)!
            case .medium:
                return UIImage(asset: Asset.liveMd)!
            case .small:
                return UIImage(asset: Asset.liveSm)!
            }
        }
    }

    private struct MastercardIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.mastercardLg)!
            case .medium:
                return UIImage(asset: Asset.mastercardMd)!
            case .small:
                return UIImage(asset: Asset.mastercardSm)!
            }
        }
    }

    private struct MenuIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.menuLg)!
            case .medium:
                return UIImage(asset: Asset.menuMd)!
            case .small:
                return UIImage(asset: Asset.menuSm)!
            }
        }
    }

    private struct MoneyIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.moneyLg)!
            case .medium:
                return UIImage(asset: Asset.moneyMd)!
            case .small:
                return UIImage(asset: Asset.moneySm)!
            }
        }
    }

    private struct NextIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.nextLg)!
            case .medium:
                return UIImage(asset: Asset.nextMd)!
            case .small:
                return UIImage(asset: Asset.nextSm)!
            }
        }
    }

    private struct NftIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.nftLg)!
            case .medium:
                return UIImage(asset: Asset.nftMd)!
            case .small:
                return UIImage(asset: Asset.nftSm)!
            }
        }
    }

    private struct NotificationIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.notificationLg)!
            case .medium:
                return UIImage(asset: Asset.notificationMd)!
            case .small:
                return UIImage(asset: Asset.notificationSm)!
            }
        }
    }

    private struct NotificationNewsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.notificationNewsLg)!
            case .medium:
                return UIImage(asset: Asset.notificationNewsMd)!
            case .small:
                return UIImage(asset: Asset.notificationNewsSm)!
            }
        }
    }

    private struct OkIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.okLg)!
            case .medium:
                return UIImage(asset: Asset.okMd)!
            case .small:
                return UIImage(asset: Asset.okSm)!
            }
        }
    }

    private struct OrdinationIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.ordinationSm)!
            case .medium:
                return UIImage(asset: Asset.ordinationSm)!
            case .small:
                return UIImage(asset: Asset.ordinationSm)!
            }
        }
    }

    private struct OverflowIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.overflowLg)!
            case .medium:
                return UIImage(asset: Asset.overflowMd)!
            case .small:
                return UIImage(asset: Asset.overflowSm)!
            }
        }
    }

    private struct OverflowVerticalIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.overflowVerticalLg)!
            case .medium:
                return UIImage(asset: Asset.overflowVerticalMd)!
            case .small:
                return UIImage(asset: Asset.overflowVerticalSm)!
            }
        }
    }

    private struct PasteIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.pasteLg)!
            case .medium:
                return UIImage(asset: Asset.pasteMd)!
            case .small:
                return UIImage(asset: Asset.pasteSm)!
            }
        }
    }

    private struct PauseIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.pauseLg)!
            case .medium:
                return UIImage(asset: Asset.pauseMd)!
            case .small:
                return UIImage(asset: Asset.pauseSm)!
            }
        }
    }

    private struct PaymentSecureIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.paymentSecureLg)!
            case .medium:
                return UIImage(asset: Asset.paymentSecureMd)!
            case .small:
                return UIImage(asset: Asset.paymentSecureSm)!
            }
        }
    }

    private struct PdfIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.pdfLg)!
            case .medium:
                return UIImage(asset: Asset.pdfMd)!
            case .small:
                return UIImage(asset: Asset.pdfSm)!
            }
        }
    }

    private struct PhotoIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.photoLg)!
            case .medium:
                return UIImage(asset: Asset.photoMd)!
            case .small:
                return UIImage(asset: Asset.photoSm)!
            }
        }
    }

    private struct PhotosIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.photosLg)!
            case .medium:
                return UIImage(asset: Asset.photosMd)!
            case .small:
                return UIImage(asset: Asset.photosSm)!
            }
        }
    }

    private struct PinIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.pinLg)!
            case .medium:
                return UIImage(asset: Asset.pinMd)!
            case .small:
                return UIImage(asset: Asset.pinSm)!
            }
        }
    }

    private struct PinOnIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.pinOnLg)!
            case .medium:
                return UIImage(asset: Asset.pinOnMd)!
            case .small:
                return UIImage(asset: Asset.pinOnSm)!
            }
        }
    }

    private struct PlayIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.playLg)!
            case .medium:
                return UIImage(asset: Asset.playMd)!
            case .small:
                return UIImage(asset: Asset.playSm)!
            }
        }
    }

    private struct PrintIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.printLg)!
            case .medium:
                return UIImage(asset: Asset.printMd)!
            case .small:
                return UIImage(asset: Asset.printSm)!
            }
        }
    }

    private struct ProductIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.productLg)!
            case .medium:
                return UIImage(asset: Asset.productMd)!
            case .small:
                return UIImage(asset: Asset.productSm)!
            }
        }
    }

    private struct ProductReviewedIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.productReviewedLg)!
            case .medium:
                return UIImage(asset: Asset.productReviewedMd)!
            case .small:
                return UIImage(asset: Asset.productReviewedSm)!
            }
        }
    }

    private struct ProtectedIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.protectedLg)!
            case .medium:
                return UIImage(asset: Asset.protectedMd)!
            case .small:
                return UIImage(asset: Asset.protectedSm)!
            }
        }
    }

    private struct QrCodeIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.qrCodeLg)!
            case .medium:
                return UIImage(asset: Asset.qrCodeMd)!
            case .small:
                return UIImage(asset: Asset.qrCodeSm)!
            }
        }
    }

    private struct RadioButtonIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.radioButtonLg)!
            case .medium:
                return UIImage(asset: Asset.radioButtonMd)!
            case .small:
                return UIImage(asset: Asset.radioButtonSm)!
            }
        }
    }

    private struct RadioButtonOnIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.radioButtonOnLg)!
            case .medium:
                return UIImage(asset: Asset.radioButtonOnMd)!
            case .small:
                return UIImage(asset: Asset.radioButtonOnSm)!
            }
        }
    }

    private struct ReceiveMoneyIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.receiveMoneyLg)!
            case .medium:
                return UIImage(asset: Asset.receiveMoneyMd)!
            case .small:
                return UIImage(asset: Asset.receiveMoneySm)!
            }
        }
    }

    private struct ReloadIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.reloadLg)!
            case .medium:
                return UIImage(asset: Asset.reloadMd)!
            case .small:
                return UIImage(asset: Asset.reloadSm)!
            }
        }
    }

    private struct RibonIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.ribonLg)!
            case .medium:
                return UIImage(asset: Asset.ribonMd)!
            case .small:
                return UIImage(asset: Asset.ribonSm)!
            }
        }
    }

    private struct RotateIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.rotateLg)!
            case .medium:
                return UIImage(asset: Asset.rotateMd)!
            case .small:
                return UIImage(asset: Asset.rotateSm)!
            }
        }
    }

    private struct ScienceIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.scienceLg)!
            case .medium:
                return UIImage(asset: Asset.scienceMd)!
            case .small:
                return UIImage(asset: Asset.scienceSm)!
            }
        }
    }

    private struct SearchIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.searchLg)!
            case .medium:
                return UIImage(asset: Asset.searchMd)!
            case .small:
                return UIImage(asset: Asset.searchSm)!
            }
        }
    }

    private struct SendIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.sendLg)!
            case .medium:
                return UIImage(asset: Asset.sendMd)!
            case .small:
                return UIImage(asset: Asset.sendSm)!
            }
        }
    }

    private struct ShareIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.shareLg)!
            case .medium:
                return UIImage(asset: Asset.shareMd)!
            case .small:
                return UIImage(asset: Asset.shareSm)!
            }
        }
    }

    private struct SportsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.sportsLg)!
            case .medium:
                return UIImage(asset: Asset.sportsMd)!
            case .small:
                return UIImage(asset: Asset.sportsSm)!
            }
        }
    }

    private struct StarRateIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.starRateLg)!
            case .medium:
                return UIImage(asset: Asset.starRateMd)!
            case .small:
                return UIImage(asset: Asset.starRateSm)!
            }
        }
    }

    private struct StarRateFilledIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.starRateFilledLg)!
            case .medium:
                return UIImage(asset: Asset.starRateFilledMd)!
            case .small:
                return UIImage(asset: Asset.starRateFilledSm)!
            }
        }
    }

    private struct StarRateHalfIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.starRateHalfLg)!
            case .medium:
                return UIImage(asset: Asset.starRateHalfMd)!
            case .small:
                return UIImage(asset: Asset.starRateHalfSm)!
            }
        }
    }

    private struct SubtitleIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.subtitleLg)!
            case .medium:
                return UIImage(asset: Asset.subtitleMd)!
            case .small:
                return UIImage(asset: Asset.subtitleSm)!
            }
        }
    }

    private struct TransferIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.transferLg)!
            case .medium:
                return UIImage(asset: Asset.transferMd)!
            case .small:
                return UIImage(asset: Asset.transferSm)!
            }
        }
    }

    private struct UploadIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.uploadLg)!
            case .medium:
                return UIImage(asset: Asset.uploadMd)!
            case .small:
                return UIImage(asset: Asset.uploadSm)!
            }
        }
    }

    private struct UserIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.userLg)!
            case .medium:
                return UIImage(asset: Asset.userMd)!
            case .small:
                return UIImage(asset: Asset.userSm)!
            }
        }
    }

    private struct VideoIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.videoLg)!
            case .medium:
                return UIImage(asset: Asset.videoMd)!
            case .small:
                return UIImage(asset: Asset.videoSm)!
            }
        }
    }

    private struct VisaIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.visaLg)!
            case .medium:
                return UIImage(asset: Asset.visaMd)!
            case .small:
                return UIImage(asset: Asset.visaSm)!
            }
        }
    }

    private struct VisibilityIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.visibilityLg)!
            case .medium:
                return UIImage(asset: Asset.visibilityMd)!
            case .small:
                return UIImage(asset: Asset.visibilitySm)!
            }
        }
    }

    private struct VisibilityOffIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.visibilityOffLg)!
            case .medium:
                return UIImage(asset: Asset.visibilityOffMd)!
            case .small:
                return UIImage(asset: Asset.visibilityOffSm)!
            }
        }
    }

    private struct WalletIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.walletLg)!
            case .medium:
                return UIImage(asset: Asset.walletMd)!
            case .small:
                return UIImage(asset: Asset.walletSm)!
            }
        }
    }

    private struct WarningIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.warningLg)!
            case .medium:
                return UIImage(asset: Asset.warningMd)!
            case .small:
                return UIImage(asset: Asset.warningSm)!
            }
        }
    }

    private struct WifiIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.wifiLg)!
            case .medium:
                return UIImage(asset: Asset.wifiMd)!
            case .small:
                return UIImage(asset: Asset.wifiSm)!
            }
        }
    }

    private struct WifiOffIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.wifiOffLg)!
            case .medium:
                return UIImage(asset: Asset.wifiOffMd)!
            case .small:
                return UIImage(asset: Asset.wifiOffSm)!
            }
        }
    }

    private struct WriteIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.writeLg)!
            case .medium:
                return UIImage(asset: Asset.writeMd)!
            case .small:
                return UIImage(asset: Asset.writeSm)!
            }
        }
    }

    private struct AdsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.adsLg)!
            case .medium:
                return UIImage(asset: Asset.adsMd)!
            case .small:
                return UIImage(asset: Asset.adsSm)!
            }
        }
    }

    private struct AlarmIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.alarmLg)!
            case .medium:
                return UIImage(asset: Asset.alarmMd)!
            case .small:
                return UIImage(asset: Asset.alarmSm)!
            }
        }
    }

    private struct ChevronRightIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.chevronRightLg)!
            case .medium:
                return UIImage(asset: Asset.chevronRightMd)!
            case .small:
                return UIImage(asset: Asset.chevronRightSm)!
            }
        }
    }

    private struct CollapseAllIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.collapseAllLg)!
            case .medium:
                return UIImage(asset: Asset.collapseAllMd)!
            case .small:
                return UIImage(asset: Asset.collapseAllSm)!
            }
        }
    }

    private struct EditIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.editLg)!
            case .medium:
                return UIImage(asset: Asset.editMd)!
            case .small:
                return UIImage(asset: Asset.editSm)!
            }
        }
    }

    private struct EmailIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.emailLg)!
            case .medium:
                return UIImage(asset: Asset.emailMd)!
            case .small:
                return UIImage(asset: Asset.emailSm)!
            }
        }
    }

    private struct ExpandAllIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.expandAllLg)!
            case .medium:
                return UIImage(asset: Asset.expandAllMd)!
            case .small:
                return UIImage(asset: Asset.expandAllSm)!
            }
        }
    }

    private struct FoldersIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.foldersLg)!
            case .medium:
                return UIImage(asset: Asset.foldersMd)!
            case .small:
                return UIImage(asset: Asset.foldersSm)!
            }
        }
    }

    private struct LeaveIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.leaveLg)!
            case .medium:
                return UIImage(asset: Asset.leaveMd)!
            case .small:
                return UIImage(asset: Asset.leaveSm)!
            }
        }
    }

    private struct LightbulbIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.lightbulbLg)!
            case .medium:
                return UIImage(asset: Asset.lightbulbMd)!
            case .small:
                return UIImage(asset: Asset.lightbulbSm)!
            }
        }
    }

    private struct NotificationOffIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.notificationOffLg)!
            case .medium:
                return UIImage(asset: Asset.notificationOffMd)!
            case .small:
                return UIImage(asset: Asset.notificationOffSm)!
            }
        }
    }

    private struct QuizIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.quizLg)!
            case .medium:
                return UIImage(asset: Asset.quizMd)!
            case .small:
                return UIImage(asset: Asset.quizSm)!
            }
        }
    }

    private struct ShoppingBagIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.shoppingBagLg)!
            case .medium:
                return UIImage(asset: Asset.shoppingBagMd)!
            case .small:
                return UIImage(asset: Asset.shoppingBagSm)!
            }
        }
    }

    private struct ShoppingCartIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.shoppingCartLg)!
            case .medium:
                return UIImage(asset: Asset.shoppingCartMd)!
            case .small:
                return UIImage(asset: Asset.shoppingCartSm)!
            }
        }
    }

    private struct UsersIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.usersLg)!
            case .medium:
                return UIImage(asset: Asset.usersMd)!
            case .small:
                return UIImage(asset: Asset.usersSm)!
            }
        }
    }

    private struct CardsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.cardsLg)!
            case .medium:
                return UIImage(asset: Asset.cardsMd)!
            case .small:
                return UIImage(asset: Asset.cardsSm)!
            }
        }
    }

    private struct ChartBarsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.chartBarsLg)!
            case .medium:
                return UIImage(asset: Asset.chartBarsMd)!
            case .small:
                return UIImage(asset: Asset.chartBarsSm)!
            }
        }
    }

    private struct ChartPieIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.chartPieLg)!
            case .medium:
                return UIImage(asset: Asset.chartPieMd)!
            case .small:
                return UIImage(asset: Asset.chartPieSm)!
            }
        }
    }

    private struct HybridPaymentIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.hybridPaymentLg)!
            case .medium:
                return UIImage(asset: Asset.hybridPaymentMd)!
            case .small:
                return UIImage(asset: Asset.hybridPaymentSm)!
            }
        }
    }

    private struct MegaphoneIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.megaphoneLg)!
            case .medium:
                return UIImage(asset: Asset.megaphoneMd)!
            case .small:
                return UIImage(asset: Asset.megaphoneSm)!
            }
        }
    }

    private struct PixIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.pixLg)!
            case .medium:
                return UIImage(asset: Asset.pixMd)!
            case .small:
                return UIImage(asset: Asset.pixSm)!
            }
        }
    }

    private struct PointsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.pointsLg)!
            case .medium:
                return UIImage(asset: Asset.pointsMd)!
            case .small:
                return UIImage(asset: Asset.pointsSm)!
            }
        }
    }

    private struct TelephoneIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.telephoneLg)!
            case .medium:
                return UIImage(asset: Asset.telephoneMd)!
            case .small:
                return UIImage(asset: Asset.telephoneSm)!
            }
        }
    }

    private struct UpSellIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.upSellLg)!
            case .medium:
                return UIImage(asset: Asset.upSellMd)!
            case .small:
                return UIImage(asset: Asset.upSellSm)!
            }
        }
    }

    private struct AdminIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.adminLg)!
            case .medium:
                return UIImage(asset: Asset.adminMd)!
            case .small:
                return UIImage(asset: Asset.adminSm)!
            }
        }
    }

    private struct ModeratorIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.moderatorLg)!
            case .medium:
                return UIImage(asset: Asset.moderatorMd)!
            case .small:
                return UIImage(asset: Asset.moderatorSm)!
            }
        }
    }

    private struct OwnerIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.ownerLg)!
            case .medium:
                return UIImage(asset: Asset.ownerMd)!
            case .small:
                return UIImage(asset: Asset.ownerSm)!
            }
        }
    }

    private struct AppsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.appsLg)!
            case .medium:
                return UIImage(asset: Asset.appsMd)!
            case .small:
                return UIImage(asset: Asset.appsSm)!
            }
        }
    }

    private struct DesignIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.designLg)!
            case .medium:
                return UIImage(asset: Asset.designMd)!
            case .small:
                return UIImage(asset: Asset.designSm)!
            }
        }
    }

    private struct DiyIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.diyLg)!
            case .medium:
                return UIImage(asset: Asset.diyMd)!
            case .small:
                return UIImage(asset: Asset.diySm)!
            }
        }
    }

    private struct EcologyIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.ecologyLg)!
            case .medium:
                return UIImage(asset: Asset.ecologyMd)!
            case .small:
                return UIImage(asset: Asset.ecologySm)!
            }
        }
    }

    private struct EducationIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.educationLg)!
            case .medium:
                return UIImage(asset: Asset.educationMd)!
            case .small:
                return UIImage(asset: Asset.educationSm)!
            }
        }
    }

    private struct EntrepreneurshipIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.entrepreneurshipLg)!
            case .medium:
                return UIImage(asset: Asset.entrepreneurshipMd)!
            case .small:
                return UIImage(asset: Asset.entrepreneurshipSm)!
            }
        }
    }

    private struct IdiomsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.idiomsLg)!
            case .medium:
                return UIImage(asset: Asset.idiomsMd)!
            case .small:
                return UIImage(asset: Asset.idiomsSm)!
            }
        }
    }

    private struct LawIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.lawLg)!
            case .medium:
                return UIImage(asset: Asset.lawMd)!
            case .small:
                return UIImage(asset: Asset.lawSm)!
            }
        }
    }

    private struct LiteratureIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.literatureLg)!
            case .medium:
                return UIImage(asset: Asset.literatureMd)!
            case .small:
                return UIImage(asset: Asset.literatureSm)!
            }
        }
    }

    private struct MusicIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.musicLg)!
            case .medium:
                return UIImage(asset: Asset.musicMd)!
            case .small:
                return UIImage(asset: Asset.musicSm)!
            }
        }
    }

    private struct OthersIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.othersLg)!
            case .medium:
                return UIImage(asset: Asset.othersMd)!
            case .small:
                return UIImage(asset: Asset.othersSm)!
            }
        }
    }

    private struct PersonalDevelopmentIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.personalDevelopmentLg)!
            case .medium:
                return UIImage(asset: Asset.personalDevelopmentMd)!
            case .small:
                return UIImage(asset: Asset.personalDevelopmentSm)!
            }
        }
    }

    private struct PetsAndPlantsIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.petsAndPlantsLg)!
            case .medium:
                return UIImage(asset: Asset.petsAndPlantsMd)!
            case .small:
                return UIImage(asset: Asset.petsAndPlantsSm)!
            }
        }
    }

    private struct SexualityIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.sexualityLg)!
            case .medium:
                return UIImage(asset: Asset.sexualityMd)!
            case .small:
                return UIImage(asset: Asset.sexualitySm)!
            }
        }
    }

    private struct SoftwareIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.softwareLg)!
            case .medium:
                return UIImage(asset: Asset.softwareMd)!
            case .small:
                return UIImage(asset: Asset.softwareSm)!
            }
        }
    }

    private struct SpiritualityIcon: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.spiritualityLg)!
            case .medium:
                return UIImage(asset: Asset.spiritualityMd)!
            case .small:
                return UIImage(asset: Asset.spiritualitySm)!
            }
        }
    }

    private struct NeutralCheckboxOn: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.neutralCheckboxOnLg)!
            case .medium:
                return UIImage(asset: Asset.neutralCheckboxOnMd)!
            case .small:
                return UIImage(asset: Asset.neutralCheckboxOnSm)!
            }
        }
    }

    private struct Certificate: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.certificateLg)!
            case .medium:
                return UIImage(asset: Asset.certificateMd)!
            case .small:
                return UIImage(asset: Asset.certificateSm)!
            }
        }
    }

    private struct Facebook: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.facebookLg)!
            case .medium:
                return UIImage(asset: Asset.facebookMd)!
            case .small:
                return UIImage(asset: Asset.facebookSm)!
            }
        }
    }

    private struct Youtube: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.youtubeLg)!
            case .medium:
                return UIImage(asset: Asset.youtubeMd)!
            case .small:
                return UIImage(asset: Asset.youtubeSm)!
            }
        }
    }

    private struct Twitter: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.twitterLg)!
            case .medium:
                return UIImage(asset: Asset.twitterMd)!
            case .small:
                return UIImage(asset: Asset.twitterSm)!
            }
        }
    }

    private struct Instagram: IconProtocol {
        func forSize(_ size: ImageSize) -> UIImage {
            switch size {
            case .large:
                return UIImage(asset: Asset.instagramLg)!
            case .medium:
                return UIImage(asset: Asset.instagramMd)!
            case .small:
                return UIImage(asset: Asset.instagramSm)!
            }
        }
    }
}
