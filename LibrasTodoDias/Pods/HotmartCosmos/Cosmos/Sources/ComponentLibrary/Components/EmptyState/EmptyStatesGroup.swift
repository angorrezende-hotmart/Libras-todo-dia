//
//  EmptyStatesGroup.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 04/11/21.
//

import Foundation

public struct EmptyStatesGroup: SystemEmptyStateGroup {
    /// Token: `empty_state_basic`
    public var basic: SystemEmptyState = BasicEmptyState()
    /// Token: `empty_state_basic_actions`
    public var actions: SystemEmptyState = ActionsEmptyState()

    struct BasicEmptyState: SystemEmptyState {
        var tokenName: String = "empty_state_basic"

        var color: SystemEmptyStateColor = EmptyStateColor()

        var typography: SystemEmptyStateTypography = EmptyStateTypography()
    }

    struct ActionsEmptyState: SystemEmptyState {
        var tokenName: String = "empty_state_basic_actions"

        var color: SystemEmptyStateColor = EmptyStateColor()

        var typography: SystemEmptyStateTypography = EmptyStateTypography()
    }

    struct EmptyStateColor: SystemEmptyStateColor {
        var title: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        var description: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral600
        }

        var roundedView: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral100
        }

        var image: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral400
        }
    }

    struct EmptyStateTypography: SystemEmptyStateTypography {
        var title: SystemTypography {
            Cosmos.typography.heading.text5
        }

        var description: SystemTypography {
            Cosmos.typography.body.text2
        }
    }
}
