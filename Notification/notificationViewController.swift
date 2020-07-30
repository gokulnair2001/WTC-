//
//  notificationViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 22/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import UserNotifications

class notificationViewController: UIViewController {

    func notificationPush() {
           
            
        //MARK:- Ask Permission of user
            
            let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: [.alert, .sound])
                {
                    (granted,error) in
                }
            //MARK:- create notification content
                
                let content = UNMutableNotificationContent()
                content.title = "Hey!, You just forgot to look whats cooking in your Kitchen, want to try something new,Get into WTC!"
                content.body = "WTC!-Cook Something New"
                
                //MARK:- To trigger the Notification
                
                let date = Date().addingTimeInterval(5)
                
                let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
                
                //MARK:- Create the request
                
                let uuidString = UUID().uuidString
                
                let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                
                center.add(request){(error) in}
    }
}
