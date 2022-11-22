//
//  ImageListGroup.swift
//  Cosmos
//
//  Created by Lucas Honorato Saldanha on 23/06/21.
//

import Foundation

public struct ImageListGroup: SystemImageList {
    /// Token: "list_image"
    public let image: SystemList = ImageList()
    /// Token: "list_image_icon"
    public let imageIcon: SystemList = ImageIconList()
    /// Token: "list_image_button"
    public let imageButton: SystemList = ImageButtonList()
}
