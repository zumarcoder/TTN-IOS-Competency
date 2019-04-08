//
//  GalleryCustomCell.swift
//  Gallery
//
//  Created by Akash Verma on 06/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class GalleryCustomCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var animatingView: UIView!
    
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        DispatchQueue.main.async {
    self.activityindicator.startAnimating()
        }
        // Initialization code
    }
    func setImage(image : UIImage)
    {
        animatingView.isHidden = true
        imageView.isHidden = false
        imageView.image = image
    }
    
    func setAuthorName(authorName : String)
    {
        authorNameLabel.text = authorName
    }

}
