//
//  UserDefinedStructAndClass.swift
//  Amazon App
//
//  Created by datamatics on 07/02/20.
//  Copyright © 2020 datamatics. All rights reserved.
//

import Foundation
import UIKit
//MARK: - Entire Product Table View Structure


enum ProductViewModelType {
    case product
    case offer
    case order
    case description
}

enum OfferViewModelType {
    case offers
    case emiCredit
    case BankOffer
    case seeMoreOffer

}

protocol ProductViewModelItem {
    var type: ProductViewModelType { get }
    var rowCount: Int { get }
    var sectionTitle: String  { get }
}

//if Row doesnot contain any Value Return 0
extension ProductViewModelItem {
    var rowCount: Int {
        return 1
    }
}


struct ProductOfferData{
    var opened:Bool
    var title:String
    var sectionData:[String]?
}
struct DescriptionData{
    var title:String
    var sectionData:String
}

class CustomTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}

extension UIApplication {
    class var topViewController: UIViewController? { return getTopViewController() }
    private class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController { return getTopViewController(base: nav.visibleViewController) }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController { return getTopViewController(base: selected) }
        }
        if let presented = base?.presentedViewController { return getTopViewController(base: presented) }
        return base
    }
}

extension Hashable {
    func share() {
        let activity = UIActivityViewController(activityItems: [self], applicationActivities: nil)
        UIApplication.topViewController?.present(activity, animated: true, completion: nil)
    }
}



extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
