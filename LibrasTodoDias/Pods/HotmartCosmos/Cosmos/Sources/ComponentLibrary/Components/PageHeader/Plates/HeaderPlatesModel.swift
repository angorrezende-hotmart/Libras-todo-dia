//
//  HeaderPlatesModel.swift
//  HotmartCosmos
//
//  Created by Lucas Honorato Saldanha on 22/10/21.
//

import Foundation

public struct HeaderPlatesModel: CosmosModel {
    public var firstPlate: Plate
    public var secondPlate: Plate?
    public var thirdPlate: Plate?
    public var fourthPlate: Plate?

    public init(
        firstPlate: Plate,
        secondPlate: Plate? = nil,
        thirdPlate: Plate? = nil,
        fourthPlate: Plate? = nil
    ) {
        self.firstPlate = firstPlate
        self.secondPlate = secondPlate
        self.thirdPlate = thirdPlate
        self.fourthPlate = fourthPlate
    }

    public struct Plate {
        public var icon: IconSet
        public var name: String

        public init(
            icon: IconSet,
            name: String
        ) {
            self.icon = icon
            self.name = name
        }
    }

    func getSystem() -> SystemHeaderPlates {
        HeaderPlatesGroup.HeaderPlates()
    }
}

public enum HeaderPlatesAction: CosmosAction {
    case tapFirstPlate
    case tapSecondPlate
    case tapThirdPlate
    case tapFourthPlate
}
