//
//  ViewController.swift
//  Gallery
//
//  Created by Akash Verma on 05/04/19.
//  Copyright © 2019 Akash Verma. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{
    var arrayData = [structJson]()
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var navBar: CustomizedNavBar!
    
    override func viewDidLoad()
    {
        let nib = UINib.init(nibName: "GalleryCustomCell", bundle: nil)
        galleryCollectionView.register(nib, forCellWithReuseIdentifier: "customCell")
        //navBar.backButton.perform(#selector(goback))
        navBar.backButton.addTarget(self, action: #selector(goback), for: .touchUpInside)
        super.viewDidLoad()
        getData()
    }
    
    @objc func goback() {
        print("already on Root")
    }
    
    
    func getData()
    {
        let url = URL(string: "https://picsum.photos/list")
        
        URLSession.shared.dataTask(with: url!) { ( data , response , error ) in
            do{
                if error == nil
                {
                    self.arrayData = try JSONDecoder().decode([structJson].self, from: data!)
                    DispatchQueue.main.async {
                        self.galleryCollectionView.reloadData()
                    }
                }
            }
        
            catch
            {
                print("Error in getData()")
            }
        }.resume()
    }
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! GalleryCustomCell
        let imageurl = "https://picsum.photos/150/134?image=\(arrayData[indexPath.row].id+1)"
        //print(imageurl)
        guard let url = URL(string: imageurl) else
        {
            return cell
        }
        UIImage.loadFrom(url: url) { image in
            cell.setImage(image: image!)
        }
        cell.setAuthorName(authorName: arrayData[indexPath.row].author)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let detail : PopupImage =  storyBoard.instantiateViewController(withIdentifier: "PopupImage") as! PopupImage
        detail.authorname = arrayData[indexPath.row].author
        detail.authorUrl = arrayData[indexPath.row].author_url
        detail.posturl = arrayData[indexPath.row].post_url
        let imageurl = "https://picsum.photos/300/400?image=\(arrayData[indexPath.row].id+1)"
        guard let url = URL(string: imageurl) else
        {
            return
        }
        UIImage.loadFrom(url: url) { image in
           detail.imageView.image = image
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension UIImage {

    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

}
