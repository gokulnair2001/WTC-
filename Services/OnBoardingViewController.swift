//
//  OnBoardingViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 26/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var continueBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        continueBtn.layer.cornerRadius = 10
    }
    

    @IBAction func continueBt(_ sender: Any) {
        self.dismiss(animated:true)
        core.shared.setIsNotNewUser()
    }
    
}
