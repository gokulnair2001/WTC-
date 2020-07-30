//
//  recipeModel.swift
//  WTC!
//
//  Created by Gokul Nair on 03/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import Foundation
import SwiftyJSON

struct jsonModel {
    
    
    var label: String = ""
    var image: String = ""
    var healthLabels:[String] = []
    var ingredientLines:[String] = []
    var calories:String = ""
    var totalTime:String = ""
    
    init() {
        
    }
    
     init(json: JSON) {
        
        label = json["label"].stringValue
        calories = json["calories"].stringValue
        totalTime = json["totalTime"].stringValue
        image = json["image"].stringValue
        healthLabels = (json["healthLabels"].arrayObject as? [String])!
        ingredientLines = (json["ingredientLines"].arrayObject as? [String])!
    }
}
struct item {
    
    var q:String = ""
    
    init() {
        
    }
    init(json: JSON) {
        
        q = json["q"].stringValue
    }
}
struct info {
    
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
 
struct infoF {
    
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
 

struct infoP {
    
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
 
struct infoW {
    
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
 
struct infoS {
    
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
 
struct infoC {
    
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
 
