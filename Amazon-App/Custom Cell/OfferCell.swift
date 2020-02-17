//
//  OfferCell.swift
//  Amazon App
//
//  Created by datamatics on 11/02/20.
//  Copyright © 2020 datamatics. All rights reserved.
//

import UIKit

protocol OfferTVUpdateDelegate: class {
    func updateTableView()
}

class OfferCell: UITableViewCell,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var offerTV: UITableView!
    var cellHeight:Any?
//    var height:CGFloat =
    weak var delegate: OfferTVUpdateDelegate?
    var tableViewData = [ProductOfferData]()
override func awakeFromNib() {
        super.awakeFromNib()
        tableViewData = [ProductOfferData(opened: false, title: "Save Extra with 5 Offers", sectionData: nil),ProductOfferData(opened: false, title: "No Cost EMI: Upto ₹884.75 EMI interest savings on select Credit Cards", sectionData: nil),ProductOfferData(opened: false, title: "Bank Offer(2): Upto ₹1,000.00 discount on HDFC Bank Credit Cards,HDFC Bank Debit..", sectionData: nil),ProductOfferData(opened: false, title: "See More Offer", sectionData: ["Cash Back: Flat Rs.50 Back on min order of Rs 50 using Amazon Pay UPI. Avialable on..","Partner Offers(2): Avail EMI on Debit Cards. Get credit up to ₹1,00,000. Check emi avialablity","Buy more Save more: Get ₹"])]
        offerTableViewCustomization()
        // Initialization code
    }
    
    //MARK :- Customization during run time Code
    
    func offerTableViewCustomization(){
        self.offerTV.delegate = self
        self.offerTV.dataSource  = self
        self.offerTV.layer.borderColor = UIColor.lightGray.cgColor
        self.offerTV.layer.borderWidth = 0.75
        self.offerTV.register(UINib(nibName: "offerTVCell", bundle: nil), forCellReuseIdentifier: "offerTVCell")
        self.offerTV.estimatedRowHeight = 60.0;
        self.offerTV.rowHeight = UITableView.automaticDimension;
        self.offerTV.reloadData()
        self.offerTV.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return tableViewData[section].sectionData!.count + 1
        }else{
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
 
    
    // Put Your Other code Lines
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "offerTVCell") as! offerTVCell
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            cell.tag = indexPath.row
            cell.textLabel?.text = tableViewData[indexPath.section].title
            if tableViewData[indexPath.section].title == " See More Offer" {
                cell.textLabel?.text = tableViewData[indexPath.section].title
                cell.textLabel?.textColor = UIColor.blue
//                let height = cell.bounds.height
//                self.height = height

            }
            
            return cell
        }else{
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData![dataIndex]
//            let height = cell.bounds.height
//            self.height = height
            return cell
        }
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.height
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            delegateUpdateMethod()
        }else{
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            delegateUpdateMethod()
        }
    }
    func delegateUpdateMethod () {
        delegate?.updateTableView()
    }

}
