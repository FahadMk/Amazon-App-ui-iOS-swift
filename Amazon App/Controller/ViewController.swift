//
//  ViewController.swift
//  Amazon App
//
//  Created by datamatics on 07/02/20.
//  Copyright © 2020 datamatics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var height:CGFloat = 404
    let sections = [ProductViewModelType.product,ProductViewModelType.offer,ProductViewModelType.order,ProductViewModelType.description]
    @IBOutlet weak var productTabeView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        self.productTabeView!.translatesAutoresizingMaskIntoConstraints = false
        self.productTabeView!.rowHeight = UITableView.automaticDimension;
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)

    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

  
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            productTabeView!.contentInset = UIEdgeInsets(top: keyboardHeight - 60, left: 0, bottom: keyboardHeight + 60, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: {
            // For some reason adding inset in keyboardWillShow is animated by itself but removing is not, that's why we have to use animateWithDuration here
            self.productTabeView!.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        })
    }
    func registerCell(){
        productTabeView!.register(UINib(nibName: "ProductInfoCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        productTabeView!.register(UINib(nibName: "offerTVCell", bundle: nil), forCellReuseIdentifier: "offerTVCell")
        productTabeView!.register(UINib(nibName: "OfferCell", bundle: nil), forCellReuseIdentifier: "OfferCell")
        productTabeView!.register(UINib(nibName: "OrderCustomerCell", bundle: nil), forCellReuseIdentifier: "OrderCustomerCell")
        productTabeView!.register(UINib(nibName: "DescriptionTVCell", bundle: nil), forCellReuseIdentifier: "DescriptionTVCell")
    }

}


extension ViewController : UITableViewDelegate,UITableViewDataSource,OfferTVUpdateDelegate,ScrollUpMainTVDelegate {
    func updateTableView() {
        self.productTabeView!.reloadData() // you do have an outlet of tableView I assume
    
    }
    func updateScrollUpMethod() {
        self.productTabeView!.setContentOffset(.zero, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = sections[section]
        //can be used if some data not avialable with this we can remove it.
        switch sectionType {
        case .product:
            return 1
        case .offer:
            return 1
        case .order:
            return 1
        case .description:
            return 1
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sections[indexPath.section]
        var productTVCell = UITableViewCell()
        switch sectionType {
        case .product:
            if let productCell = self.productTabeView?.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductInfoCell{
                let height = productCell.bounds.height
                self.height = height
                productCell.selectionStyle = .none
                productTVCell = productCell
            }
        case .offer:
            if let offerCell = self.productTabeView?.dequeueReusableCell(withIdentifier: "OfferCell", for: indexPath) as? OfferCell{
                let height = offerCell.bounds.height
                self.height = height
                offerCell.selectionStyle = .none
                offerCell.delegate = self
                productTVCell = offerCell
            }
        case .order:
            if let orderCell = self.productTabeView?.dequeueReusableCell(withIdentifier: "OrderCustomerCell", for: indexPath) as? OrderCustomerCell{
                let height = orderCell.bounds.height
                self.height = height
                orderCell.selectionStyle = .none
                productTVCell = orderCell
            }
        case .description:
            if let descriptionCell = self.productTabeView?.dequeueReusableCell(withIdentifier: "DescriptionTVCell", for: indexPath) as? DescriptionTVCell{
                let height = descriptionCell.bounds.height
                self.height = height
                descriptionCell.selectionStyle = .none
                productTVCell = descriptionCell
            }
        }
        
        return productTVCell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.height
    }
}
