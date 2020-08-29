//
//  IconChangeViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 21/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class IconChangeViewController: UIViewController {

    let haptic = haptickFeedback()

    let appIconSer = appiconFunction()
    
  
    @IBOutlet weak var white: UIImageView!
    @IBOutlet weak var orange: UIImageView!
    @IBOutlet weak var black: UIImageView!
    @IBOutlet weak var green: UIImageView!
    @IBOutlet weak var grey: UIImageView!
    @IBOutlet weak var pink: UIImageView!
    @IBOutlet weak var purple: UIImageView!
    @IBOutlet weak var skin: UIImageView!
    @IBOutlet weak var magenta: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        white.layer.cornerRadius = 10
        white.layer.borderWidth = 1
        white.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        black.layer.cornerRadius = 10
        black.layer.borderWidth = 1
        black.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        orange.layer.cornerRadius = 10
        orange.layer.borderWidth = 1
        orange.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        green.layer.cornerRadius = 10
        green.layer.borderWidth = 1
        green.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        grey.layer.cornerRadius = 10
        grey.layer.borderWidth = 1
        grey.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        pink.layer.cornerRadius = 10
        pink.layer.borderWidth = 1
        pink.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        purple.layer.cornerRadius = 10
        purple.layer.borderWidth = 1
        purple.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        skin.layer.cornerRadius = 10
        skin.layer.borderWidth = 1
        skin.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        magenta.layer.cornerRadius = 10
        magenta.layer.borderWidth = 1
        magenta.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        haptic.haptiFeedback2()
    }
    
    

}
//MARK:- Function to change App icon

extension IconChangeViewController {
    
    
    @IBAction func white(_ sender: Any) {
        appIconSer.changeAppIcon(to: .primaryAppIcon)
        haptic.haptiFeedback1()
    }
    @IBAction func orange(_ sender: Any) {
        appIconSer.changeAppIcon(to: .orange)
        haptic.haptiFeedback1()
        
    }
    @IBAction func black(_ sender: Any) {
        appIconSer.changeAppIcon(to: .black)
        haptic.haptiFeedback1()
    }
    @IBAction func green(_ sender: Any) {
        appIconSer.changeAppIcon(to: .green)
        haptic.haptiFeedback1()
    }
    @IBAction func grey(_ sender: Any) {
        appIconSer.changeAppIcon(to: .grey)
        haptic.haptiFeedback1()
    }
    @IBAction func pink(_ sender: Any) {
        appIconSer.changeAppIcon(to: .pink)
        haptic.haptiFeedback1()
        
    }
    @IBAction func purple(_ sender: Any) {
        appIconSer.changeAppIcon(to: .purple)
        haptic.haptiFeedback1()
    }
    @IBAction func skin(_ sender: Any) {
        appIconSer.changeAppIcon(to: .skin)
               haptic.haptiFeedback1()
    }
    @IBAction func magenta(_ sender: Any) {
        appIconSer.changeAppIcon(to: .magenta)
        haptic.haptiFeedback1()
    }
    
   
    
}

//MARK:- Function for Report Bug as well as Suggestions
