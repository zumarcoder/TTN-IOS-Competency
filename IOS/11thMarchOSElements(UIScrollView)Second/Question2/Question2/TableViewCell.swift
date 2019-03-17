//
//  TableViewCell.swift
//  Question2
//
//  Created by Akash Verma on 17/03/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource  {
   
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib.init(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "viewCell")
        
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    
}
