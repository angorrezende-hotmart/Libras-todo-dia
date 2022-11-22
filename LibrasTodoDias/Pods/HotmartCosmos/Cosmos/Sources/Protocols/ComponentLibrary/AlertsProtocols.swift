//
//  AlertsProtocols.swift
//  Cosmos
//
//  Created by Luisa Franco Marzinette Pimentel on 04/06/21.
//

import Foundation

public protocol SystemAlerts {
    var alert: SystemAlert { get }
    var actionSheet: SystemAlert { get }
}

public protocol SystemAlertController: Bindable {
    func makeAlert() -> UIAlertController
}
