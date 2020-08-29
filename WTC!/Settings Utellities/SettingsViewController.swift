//
//  SettingsViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 11/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    let haptic = haptickFeedback()
    let appIconSer = appiconFunction()
    
    @IBOutlet weak var layer1: UIImageView!
    @IBOutlet weak var layer2: UIImageView!
    @IBOutlet weak var SwitchButton: UISwitch!
    @IBOutlet weak var layer3: UIImageView!
    
    let defaults = UserDefaults.standard
    var switchON : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layer1.layer.cornerRadius = 10
        layer2.layer.cornerRadius = 10
        layer3.layer.cornerRadius = 10
        
    }
    
    @IBAction func selectButton(_ sender: Any) {
        haptic.haptiFeedback1()
    }
    
   
    @IBAction func themeSelection(_ sender: Any) {
         haptic.haptiFeedback1()
    }
    @IBAction func appInfo(_ sender: Any) {
         haptic.haptiFeedback1()
    }
    @IBAction func developerInfo(_ sender: Any) {
         haptic.haptiFeedback1()
    }
    
}

//MARK:-  Function For Dark Mode

extension SettingsViewController {
    
    @IBAction func DarkMode(_ sender: UIButton) {
        
        if SwitchButton.isOn == true {
            switchON = true
            defaults.set(switchON, forKey: "switchON")
            defaults.synchronize()
            tabBarController?.overrideUserInterfaceStyle = .dark
            
            haptic.haptiFeedback1()
            
        }
        else {
            switchON = false
            defaults.set(switchON, forKey: "switchON")
            defaults.synchronize()
            tabBarController?.overrideUserInterfaceStyle = .light
            haptic.haptiFeedback1()
        } 
    }
}




//MARK:- Function for Report Bug as well as Suggestions

extension SettingsViewController {
    

     @IBAction func suggetBtn(_ sender: Any) {
        suggestionMail()
        print("sugg")
        haptic.haptiFeedback1()
     }
    
    @IBAction func featureReqBtn(_ sender: Any) {
        featureRequest()
        print("feature")
        haptic.haptiFeedback1()
       }
       
       @IBAction func bugBtn(_ sender: Any) {
        bugReport()
        print("bug")
               haptic.haptiFeedback1()
       }
    
}
//MARK:- Mail Setup
extension SettingsViewController{
    
    
    func suggestionMail() {
        guard MFMailComposeViewController.canSendMail() else {
            
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["gokulnair.2001@gmail.com"])
        composer.setSubject("Suggestion For WTC!")
        composer.setMessageBody("Hi Gokul, Want to give you a suggestion ", isHTML: false)
        
        present(composer, animated: true)
    }
    
    func bugReport() {
        guard MFMailComposeViewController.canSendMail() else {
            
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["gokulnair.2001@gmail.com"])
        composer.setSubject("Bug Report in WTC!")
        composer.setMessageBody("Hi Gokul, Want to inform you a bug ", isHTML: false)
        
        present(composer, animated: true)
    }
    
    func featureRequest() {
        guard MFMailComposeViewController.canSendMail() else {
                   
                   return
               }
               let composer = MFMailComposeViewController()
               composer.mailComposeDelegate = self
               composer.setToRecipients(["gokulnair.2001@gmail.com"])
               composer.setSubject("Feature Request For WTC!")
               composer.setMessageBody("Hi Gokul, want to request you a feature for WTC! ", isHTML: false)
               
               present(composer, animated: true)
    }
    
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            return
        }
        switch result {
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        @unknown default:
            print("other error")
        }
        controller.dismiss(animated: true, completion: nil)
        }
    }



extension SettingsViewController {
    @IBAction func shareWTC(_ sender: Any) {
        
        let activityController = UIActivityViewController(activityItems: ["WTC!- What To Cook! , This is an app made for people who are much into foods or intrested in cooking. This app helps the user to find more than 100's of recipe's with help of single key ingredient you search in. Get your key ingredient and search recipes related to it in this app. Not only this , the app consists of an nutrition chart which shows the user the amount of nutrition the food consists of. The bar graph in the chart helps the user to have a quick glance on the nutritional value. Not only this you get an option to change our app icon in this app, select your app icon as per the choices given, there are much more things to see in this app, Download it and have a look on everything.", UIImage(imageLiteralResourceName: "white")], applicationActivities: nil)
           
        present(activityController, animated: true, completion: nil)
        
        haptic.haptiFeedback1()
       }
    
}
