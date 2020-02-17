//
//  ProductSpecPopUpVC.swift
//  Amazon App
//
//  Created by datamatics on 14/02/20.
//  Copyright © 2020 datamatics. All rights reserved.
//

import UIKit

class ProductSpecPopUpVC: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    
    var qtyNumber = [1,2,3,4,5,6]
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var quantityTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quantityTableView.delegate = self
        self.quantityTableView.dataSource = self
        self.quantityTableView.register(UINib(nibName: "popQtyCell", bundle: nil), forCellReuseIdentifier: "popCell")
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qtyNumber.count
    }
  func touchesBegan(_ touches: Set<AnyHashable>, with event: UIEvent) {
    let touch: UITouch = touches.first as! UITouch
        //location is relative to the current view
        // do something with the touched point
    if touch.view != self.view {
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func handleDissmiss(_ sender: Any) {
        self.dismiss(animated: false)
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "popCell") as? popQtyCell{
            cell.textLabel?.text = String(qtyNumber[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: false)
    }
}
