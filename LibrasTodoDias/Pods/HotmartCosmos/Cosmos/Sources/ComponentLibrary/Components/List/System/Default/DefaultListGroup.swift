//
//  DefaultListGroup.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import Foundation

public struct DefaultListGroup: SystemDefaultList {
    /// Token: "list_default_simple"
    public let simple: SystemList = DefaultSimpleList()
    /// Token: "list_default_tag"
    public let tag: SystemList = DefaultTagList()
    /// Token: "list_default_licon"
    public let leftIcon: SystemList = DefaultLeftIconList()
    /// Token: "list_default_licon_tag"
    public let leftIconTag: SystemList = DefaultLeftIconTagList()
    /// Token: "list_default_ricon"
    public let rightIcon: SystemList = DefaultRightIconList()
}
