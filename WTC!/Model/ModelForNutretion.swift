//
//  ModelForNutretion.swift
//  WTC!
//
//  Created by Gokul Nair on 15/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import Foundation
import SwiftyJSON

struct  HlthLabel{
    
    var healthLabels:[String] = []
    
    init() {
        
    }
    
    init(json: JSON) {
       healthLabels = (json["healthLabels"].arrayObject as? [String])!
    }
    
    
}

struct calories {
    var calories:String = ""
    
    init() {
           
       }

    init(json: JSON) {
        
        calories = json["calories"].stringValue
    }
    
    
}

struct dietLabels {
    var dietLabels:[String] = []
    
    init() {
        
    }
    
    init(json:JSON) {
     
     dietLabels = (json["dietLabels"].arrayObject as? [String])!
    }
}

struct cautions {
    var cautions:String = ""
    
    init() {
        
    }
    
    init(json:JSON) {
        cautions = json["cautions"].stringValue
    }
}
struct NutriEnergy {
    
    var label: String = ""
    var quantity: String = ""
    var unit: String = ""
    init() {
         
    }
    
    init(json: JSON) {
        
        label = json["label"].stringValue
        quantity = json["quantity"].stringValue
        unit = json["unit"].stringValue
        
    }
}
 
struct NutriFat {
    
    var label: String = ""
    var quantity: String = ""
    var unit: String = ""
    init() {
         
    }
    
    init(json: JSON) {
        
        label = json["label"].stringValue
        quantity = json["quantity"].stringValue
        unit = json["unit"].stringValue
        
    }
}
 

struct NutriPro {
    
    var label: String = ""
    var quantity: String = ""
    var unit: String = ""
    init() {
         
    }
    
    init(json: JSON) {
        
        label = json["label"].stringValue
        quantity = json["quantity"].stringValue
        unit = json["unit"].stringValue
        
    }
}
 
struct NutriWater {
    
    var label: String = ""
    var quantity: String = ""
    var unit: String = ""
    init() {
         
    }
    
    init(json: JSON) {
        
        label = json["label"].stringValue
        quantity = json["quantity"].stringValue
        unit = json["unit"].stringValue
        
    }
}
 
struct NutriSugar {
    
    var label: String = ""
    var quantity: String = ""
    var unit: String = ""
    init() {
         
    }
    
    init(json: JSON) {
        
        label = json["label"].stringValue
        quantity = json["quantity"].stringValue
        unit = json["unit"].stringValue
        
    }
}
 
struct NutriCho {
    
    var label: String = ""
    var quantity: String = ""
    var unit: String = ""
    init() {
         
    }
    
    init(json: JSON) {
        
        label = json["label"].stringValue
        quantity = json["quantity"].stringValue
        unit = json["unit"].stringValue
        
    }
}
 
