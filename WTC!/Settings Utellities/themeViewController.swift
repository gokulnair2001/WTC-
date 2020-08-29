//
//  themeViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 22/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class themeViewController: UIViewController {
    //MARK:- Outlets
    
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var layer1: UIImageView!
    @IBOutlet weak var layer2: UIImageView!
    @IBOutlet weak var layer3: UIImageView!
    @IBOutlet weak var layer4: UIImageView!
    @IBOutlet weak var layer5: UIImageView!
    @IBOutlet weak var layer6: UIImageView!
    @IBOutlet weak var layer7: UIImageView!
    @IBOutlet weak var layer8: UIImageView!
    @IBOutlet weak var layer9: UIImageView!
    @IBOutlet weak var layer10: UIImageView!
    @IBOutlet weak var layer11: UIImageView!
    @IBOutlet weak var layer12: UIImageView!
    @IBOutlet weak var layer13: UIImageView!
    @IBOutlet weak var layer14: UIImageView!
    
    //Theme btn outlets
    
    var main = MainViewController()
    
    let haptic = haptickFeedback()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.themeUI()
    }
    
    
    
    
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        haptic.haptiFeedback2()
    }
    
}

extension themeViewController {
    
    func themeUI() {
        layer1.layer.cornerRadius = 10
        layer2.layer.cornerRadius = 10
        layer3.layer.cornerRadius = 10
        layer4.layer.cornerRadius = 10
        layer5.layer.cornerRadius = 10
        layer6.layer.cornerRadius = 10
        layer7.layer.cornerRadius = 10
        layer8.layer.cornerRadius = 10
        layer9.layer.cornerRadius = 10
        layer10.layer.cornerRadius = 10
        layer11.layer.cornerRadius = 10
        layer12.layer.cornerRadius = 10
        layer13.layer.cornerRadius = 10
        
    }
}


extension themeViewController {
    @IBAction func green(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func orange(_ sender: Any) {
    
        haptic.haptiFeedback1()
    }
    @IBAction func red(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func yellow(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func tint(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func purple(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func teal(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func pink(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func indigo(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func grey(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func black(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func custPink(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func brown(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    @IBAction func custOrange(_ sender: Any) {
        haptic.haptiFeedback1()
    }
}
