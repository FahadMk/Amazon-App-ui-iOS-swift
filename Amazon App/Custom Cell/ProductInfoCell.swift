//
//  ProductInfoCell.swift
//  Amazon App
//
//  Created by datamatics on 07/02/20.
//  Copyright © 2020 datamatics. All rights reserved.
//

import UIKit

class ProductInfoCell: UITableViewCell ,UICollectionViewDelegate,UICollectionViewDataSource, UIScrollViewDelegate{
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var likeBtn: UIButton!
    
    var buttonClicked:Bool = false
    var productImages:[String] = ["appleWatch_slide_1.jpg","applewatch_slide2.jpg"]
    override func awakeFromNib() {
        super.awakeFromNib()
        self.offerLabel.layer.cornerRadius = self.offerLabel.frame.size.height/2
        self.offerLabel.layer.masksToBounds = true
        self.imageCollectionView.dataSource = self
        self.imageCollectionView.delegate = self
        self.imageCollectionView.register(UINib.init(nibName: "ImageCollectionVC", bundle: nil), forCellWithReuseIdentifier: "CollectionViewID")
    }

    @IBAction func likeBtnClicked(_ sender: Any) {
        if !self.buttonClicked {
            (sender as AnyObject).setImage(UIImage(named: "clickedHeart.png"), for: UIControl.State.normal)
            self.buttonClicked = true
            
        }else{
            (sender as AnyObject).setImage(UIImage(named: "heart.png"), for: UIControl.State.normal)
            self.buttonClicked = false
        }
    }
    @IBAction func shareBtnClicked(_ sender: Any) {
        "Apple Watch 3 series Share:".share()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewID", for: indexPath as IndexPath) as! ImageCollectionVC
        cell.productImageView.image = UIImage(named: productImages[indexPath.row])
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
