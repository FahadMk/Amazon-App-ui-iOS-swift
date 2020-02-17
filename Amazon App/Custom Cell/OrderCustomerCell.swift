//
//  OrderCustomerCell.swift
//  Amazon App
//
//  Created by datamatics on 12/02/20.
//  Copyright © 2020 datamatics. All rights reserved.
//

import UIKit

protocol ScrollUpMainTVDelegate: class {
    func updateScrollUpMethod()
}

class OrderCustomerCell: UITableViewCell ,UIActionSheetDelegate{
    var scrollDelegate :ScrollUpMainTVDelegate?
    @IBOutlet weak var qtyBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func displaySpecSelected(_ sender: Any) {
        scrollAboveMethod()
        let popUpVC = SizePopUpVC()
        popUpVC.modalTransitionStyle = .coverVertical
        popUpVC.modalPresentationStyle = .overCurrentContext
        UIApplication.shared.keyWindow?.rootViewController?.present(popUpVC, animated: true, completion: nil)
    }
    
    @IBAction func QtyBtnClicked(_ sender: Any) {
        
        let popUpVC = ProductSpecPopUpVC()
        popUpVC.modalTransitionStyle = .crossDissolve
        popUpVC.modalPresentationStyle = .overCurrentContext
         UIApplication.shared.keyWindow?.rootViewController?.present(popUpVC, animated: true, completion: nil)
//        let alert = UIAlertController(title: "Quantity", message: "1\n2\n3\n4\n5\n6", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(okAction)
//        alert.show()
     //   UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func scrollAboveMethod(){
        scrollDelegate?.updateScrollUpMethod()
    }
}
