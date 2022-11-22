//
//  AcessoryMidiaGroup.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 07/05/21.
//

import Foundation

struct AcessoryMidiaGroup: SystemAcessoryMidiaGroup {
    /// Token: `tag_live`
    let live: SystemAcessoryMidia = Live()

    /// Token: `tag_audio`
    let audio: SystemAcessoryMidia = Audio()

    /// Token: `tag_video`
    let video: SystemAcessoryMidia = Video()

    /// Token `tag_text`
    let text: SystemAcessoryMidia = Text()

    /// Token `tag_circle`
    let circle: SystemAcessoryMidia = Circle()

    private struct Live: SystemAcessoryMidia {
        let tokenName: String = "tag_live"

        var typography: SystemTypography? {
            Cosmos.typography.bodyStrong.text0Strong
        }

        var color: SystemColor {
            Cosmos.colors.productColors.redProductColor.color
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.backgroundPrimary
        }
    }

    private struct Audio: SystemAcessoryMidia {
        let tokenName: String = "tag_audio"

        var typography: SystemTypography? {
            Cosmos.typography.bodyStrong.text0Strong
        }

        var color: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.backgroundPrimary
        }
    }

    private struct Video: SystemAcessoryMidia {
        let tokenName: String = "tag_video"

        var typography: SystemTypography? {
            Cosmos.typography.bodyStrong.text0Strong
        }

        var color: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.backgroundPrimary
        }
    }

    private struct Text: SystemAcessoryMidia {
        let tokenName: String = "tag_text"

        var typography: SystemTypography? {
            Cosmos.typography.bodyStrong.text0Strong
        }

        var color: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.neutral900
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.backgroundPrimary
        }
    }

    private struct Circle: SystemAcessoryMidia {
        let tokenName: String = "tag_circle"

        var typography: SystemTypography?

        var color: SystemColor {
            Cosmos.colors.productColors.neutralProductColor.white
        }

        var backgroundColor: SystemColor {
            Cosmos.colors.productColors.greenProductColor.color
        }
    }
}
