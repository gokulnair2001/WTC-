//
//  appiconFunction.swift
//  WTC!
//
//  Created by Gokul Nair on 12/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class appiconFunction: UIViewController {

    let application = UIApplication.shared
    
    enum AppIcon: String {
        case primaryAppIcon
        case orange
        case pink
        case magenta
        case skin
        case green
        case black
        case grey
        case purple
    }
    
    func changeAppIcon(to appIcon: AppIcon){
        
        let appIconValue: String? = appIcon == .primaryAppIcon ? nil : appIcon.rawValue
        application.setAlternateIconName(appIconValue)
        
    }

}
