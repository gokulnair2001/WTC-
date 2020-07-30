//
//  ViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 03/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
import NotificationCenter

class MainViewController: UIViewController{
    
    @IBOutlet weak var SearchBar: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    
    var recipe = recipeManager()
    var haptick = haptickFeedback()
    var model: [item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        pushNotification()
       
        if core.shared.isNewUser() {
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! OnBoardingViewController
            present(vc, animated: true)
        }
    }
    
    
}

extension MainViewController: UITextFieldDelegate {
    
    @IBAction func searchBtn(_ sender: Any) {
        SearchBar.endEditing(true)
        //this is line of code helps to relode tableview
        self.haptick.haptiFeedback1()
        self.relode()
    }
    
    func relode() {
        self.tableView.reloadData()
        self.tableView.reloadInputViews()
        self.tableView.reloadSectionIndexTitles()
        //self.itemLabel.text = recipe.itemName.
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        SearchBar.endEditing(true)
        
        return true
        
    }
    
    @IBAction func refreshBTN(_ sender: Any) {
        relode()
        self.haptick.haptiFeedback1()
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != "" {
            return true
        }else{
            textField.placeholder = "Type Something"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let Item = SearchBar.text {
            self.recipe.jsonParsing(ingredient: Item)
        }
        
        SearchBar.text = ""
    }
    
    
}

extension MainViewController: RecipeManagerDelegate {
    
    func didUpdateRecipe(_ RecipeManager: recipeManager, model: jsonModel, Info: info) {
        
        
        
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            let alertControl = UIAlertController(title:"Error", message: "Lost Connection", preferredStyle: .actionSheet)
            alertControl.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertControl, animated: true,completion: nil)
        }
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipe.arrData.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.calloriesLabel.text = recipe.arrData[indexPath.row].calories //.trimmingCharacters(in: .newlines)
        cell.timeLabel.text = recipe.arrData[indexPath.row].totalTime
        cell.nameLabel.text = recipe.arrData[indexPath.row].label
        cell.recipeImage.kf.setImage(with: URL(string: recipe.arrData[indexPath.row].image))
        cell.selectionStyle = .none // used to make cell selection nil.....no selection animation
        
        cell.backgroundColor = #colorLiteral(red: 0, green: 0.8103109002, blue: 0.3610905409, alpha: 0.8680436644)
        cell.layer.cornerRadius = 30
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.layer.shadowOffset = CGSize(width: 2,height: 2)
        cell.layer.masksToBounds = false
        cell.clipsToBounds = true
        
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var indexPos = 0
        indexPos = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
        haptick.haptiFeedback1()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  let vc = segue.destination as? DetailRecipeVC {
            //print("hellllll")
            vc.model = recipe.arrData[tableView.indexPathForSelectedRow!.row]
        }
                
      
        }
    }
    
//MARK:- NotificationStuffs

extension MainViewController {
    
    //MARK:- Ask Permission of user
    func pushNotification() {
        
      let state = UIApplication.shared.applicationState
      if state == .inactive {
        
        self.notification()
          
      }
      else if state == .inactive || state == .background{
        
        self.notification()
        
        }
        
       
    }
    //MARK:- Notification code func
    
    func notification() {
               let center = UNUserNotificationCenter.current()
                      center.requestAuthorization(options: [.alert, .sound])
                      {
                          (granted,error) in
                      }
                      //MARK:- create notification content
                      
                      let content = UNMutableNotificationContent()
                      content.title = "WTC!-Cook Something New"
                      content.body = "Hey!, You just forgot to look whats going on in your Kitchen, want to try something new, Get into WTC!"
                      
                      //MARK:- To trigger the Notification
                      
                      let date = Date().addingTimeInterval(15)
                      
                      let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
                      
                      let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
                      
                      //MARK:- Create the request
                      
                      let uuidString = UUID().uuidString
                      
                      let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                      
                      center.add(request){(error) in}
           }
          
}

//MARK:-  Onboarding Code

class core{
    
    static let shared = core()
    
    func isNewUser()->Bool {
        return !UserDefaults.standard.bool(forKey: "onboarding")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "onboarding")
    }
}
