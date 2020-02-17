//
//  SizePopUpVC.swift
//  Amazon App
//
//  Created by datamatics on 14/02/20.
//  Copyright © 2020 datamatics. All rights reserved.
//

import UIKit

class SizePopUpVC: UIViewController {

    @IBOutlet weak var secondSizeBtn: UIButton!
    @IBOutlet weak var firstSizeBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstSizeBtn.isSelected = true
        // Do any additional setup after loading the view.
    }


    @IBAction func doneBtnClicked(_ sender: Any) {
         self.dismiss(animated: false)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
