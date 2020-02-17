//
//  DescriptionTVCell.swift
//  Amazon App
//
//  Created by datamatics on 13/02/20.
//  Copyright © 2020 datamatics. All rights reserved.
//

import UIKit

class DescriptionTVCell: UITableViewCell,UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var descriptionTV: CustomTableView!
    
    @IBOutlet weak var otherBoughtTV: CustomTableView!
    @IBOutlet weak var questionField: UITextField! {
        didSet {
            questionField.tintColor = UIColor.lightGray
            questionField.setIcon(UIImage(named: "search_icon.png")!)
        }
    }
    var descriptionContent :[DescriptionData] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionContent = [DescriptionData(title: "Description", sectionData: "Low and high heart rate notifications. Emergency SOS. New Breathe watch faces. Automatic workout detection. New yoga and hiking workouts. Advanced features for runners like cadence and pace alerts. New head-to-head competitions. Activity sharing with friends. Personalized coaching. Monthly challenges and achievement awards. You can use Walkie-Talkie, make phone calls, and send messages. Listen to Apple Music and Apple Podcasts. And use Siri in all-new ways. Apple Watch Series 3 lets you do it all right from your wrist.Customer care: 1-800-692-7753"),DescriptionData(title: "Features & details", sectionData: "GPS \n Optical heart sensor. Swimproof \nDigital Crown \nS3 with dual-core processor\nAccelerometer and gyroscope\nCustomer care: 1-800-692-7753\nwatchOS 5. Aluminium case\nManufacturer Detail: Apple Inc, One Apple Park Way, Cupertino, CA 95014, USAmporter Details: Apple India Private Limited No.24, 19th floor, concorde Tower C, UB City, Vital Mallya Road, Bangalore-560001\n <b> Product Details</b>\nManufacturer: Apple Computer\nItem part number: MQKV2HN/A\nPackage Dimensions: 31.8 x 6.8 x 3.4 cm; 27.2 g\nASIN: B075RB1D44\nAmazon.in Sales Rank: 9")]
        DescriptionTableViewCustomization()
        otherBoughtTableViewCustomization()
        // Initialization code
    }
    
    func otherBoughtTableViewCustomization(){
        self.otherBoughtTV.delegate = self
        self.otherBoughtTV.dataSource = self
        self.otherBoughtTV.layer.borderColor = UIColor.lightGray.cgColor
        self.otherBoughtTV.layer.borderWidth = 0.75
        self.otherBoughtTV.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "frequentReCell")
    }
    
    func DescriptionTableViewCustomization(){
        self.descriptionTV.delegate = self
        self.descriptionTV.dataSource  = self
        self.descriptionTV.layer.borderColor = UIColor.lightGray.cgColor
        self.descriptionTV.layer.borderWidth = 0.75
        self.descriptionTV.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "reUseDiscCell")
        
        self.descriptionTV.rowHeight = UITableView.automaticDimension;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == descriptionTV{
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "reUseDiscCell") as? DescriptionCell{
                cell.textLabel?.text = descriptionContent[indexPath.section].sectionData
                return cell
            }
        }else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "frequentReCell") as? TableViewCell{
                return cell
            }
        }
        return UITableViewCell()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == descriptionTV{
            return descriptionContent.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        // Ensure that this is a safe cast
         if tableView == descriptionTV {
            return descriptionContent[section].title
        }
        return nil
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == descriptionTV{
            let myLabel = UILabel()
            myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
            myLabel.font = UIFont.boldSystemFont(ofSize: 18)
            myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
            
            let headerView = UIView()
            headerView.addSubview(myLabel)
            
            return headerView
        }
        return UIView()
    }
   
}
