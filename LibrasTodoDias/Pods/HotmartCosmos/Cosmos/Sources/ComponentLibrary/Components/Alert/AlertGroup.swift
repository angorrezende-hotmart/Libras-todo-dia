//
//  AlertGroup.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 01/06/21.
//

import Foundation
import UIKit

public struct AlertsGroup: SystemAlerts {
    /// Token: `cosmos_alert`
    public var alert: SystemAlert = Alert()
    /// Token: `cosmos_actionSheet`
    public var actionSheet: SystemAlert = ActionSheet()

    struct Alert: SystemAlert {
        let tokenName: String = "cosmos_alert"
        var titleColor: UIColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900.color
        }

        var descriptionColor: UIColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600.color
        }

        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var descriptionTypography: SystemTypography {
            Cosmos.typography.body.text2
        }

        var buttonColor: UIColor {
            Cosmos.colors.primaryBrandColor.color.color
        }
    }

    struct ActionSheet: SystemAlert {
        let tokenName: String = "cosmos_actionSheet"
        var titleColor: UIColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900.color
        }

        var descriptionColor: UIColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600.color
        }

        var titleTypography: SystemTypography {
            Cosmos.typography.bodyStrong.text2Strong
        }

        var descriptionTypography: SystemTypography {
            Cosmos.typography.body.text2
        }

        var buttonColor: UIColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900.color
        }
    }

    public init() {}
}
