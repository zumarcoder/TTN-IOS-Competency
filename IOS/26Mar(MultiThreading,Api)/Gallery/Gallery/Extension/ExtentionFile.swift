//
//  ExtentionFile.swift
//  Gallery
//
//  Created by Akash Verma on 08/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func roundCorner(cornerRadiuss : CGFloat , maskRadiuss : CACornerMask)
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadiuss
        self.layer.maskedCorners = maskRadiuss
    }
}
