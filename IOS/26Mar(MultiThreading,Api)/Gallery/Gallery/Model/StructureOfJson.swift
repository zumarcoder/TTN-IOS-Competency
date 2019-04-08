//
//  StructureOfJson.swift
//  Gallery
//
//  Created by Akash Verma on 06/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import Foundation
import UIKit

struct structJson : Decodable {
    let format : String
    let width : Int
    let height : Int
    let filename : String
    let id : Int
    let author : String
    let author_url : String
    let post_url : String
}
