//
//  DeveloperInfoVC.swift
//  WTC!
//
//  Created by Gokul Nair on 21/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class DeveloperInfoVC: UIViewController {
    
    let haptick = haptickFeedback()

    @IBOutlet var linkdein: UITapGestureRecognizer!
    
    @IBAction func linkdein(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.linkedin.com/in/gokul-r-nair/")! as URL, options: [:], completionHandler: nil)
        haptick.haptiFeedback1()
        }
    @IBAction func git(_ sender: Any) {
          UIApplication.shared.open(URL(string: "https://github.com/gokulnair2001")! as URL, options: [:], completionHandler: nil)
        haptick.haptiFeedback1()
    }
    @IBAction func insta(_ sender: Any) {
         UIApplication.shared.open(URL(string: "https://www.instagram.com/_gokul_r_nair_/")! as URL, options: [:], completionHandler: nil)
        haptick.haptiFeedback1()
    }
    @IBAction func twitter(_ sender: Any) {
         UIApplication.shared.open(URL(string: "https://twitter.com/GokulRN38554108")! as URL, options: [:], completionHandler: nil)
        haptick.haptiFeedback1()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
   

}
