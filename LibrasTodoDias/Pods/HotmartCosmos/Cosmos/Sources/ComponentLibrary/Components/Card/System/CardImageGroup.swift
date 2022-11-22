//
//  CardStyle.swift
//  Cosmos
//
//  Created by Rafael Lage Moreira Barbosa on 03/05/21.
//

import Foundation

struct CardImageGroup: SystemCardImageGroup {
    /// Token: `card_img_1` Proportion: `1`
    let img1: SystemCardImage = CardImage1()

    /// Token: `card_img_2` Proportion: `4/3`
    let img2: SystemCardImage = CardImage2()

    /// Token: `card_img_3` Proportion: `16/9`
    let img3: SystemCardImage = CardImage3()

    /// Token: `card_img_4` Proportion: `4/5`
    let img4: SystemCardImage = CardImage4()

    struct CardImage1: SystemCardImage {
        let tokenName: String = "card_img_1"
        let proportion: CGFloat = 1
        let resolution: CardResolution = .squared
    }

    struct CardImage2: SystemCardImage {
        let tokenName: String = "card_img_2"
        let proportion: CGFloat = 4 / 3
        let resolution: CardResolution = .wide
    }

    struct CardImage3: SystemCardImage {
        let tokenName: String = "card_img_3"
        let proportion: CGFloat = 16 / 9
        let resolution: CardResolution = .ultraWide
    }

    struct CardImage4: SystemCardImage {
        let tokenName: String = "card_img_4"
        let proportion: CGFloat = 4 / 5
        let resolution: CardResolution = .portrait
    }
}
