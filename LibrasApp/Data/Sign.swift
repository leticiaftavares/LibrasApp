//
//  Sign.swift
//  LibrasApp
//
//  Created by User on 27/04/26.
//

import Foundation
import CloudKit
import Nuvem

@CKModel
struct Sign {
    @CKField("name")
    var name: String
    @CKAssetField("video")
    var video: UIVideo?
}



