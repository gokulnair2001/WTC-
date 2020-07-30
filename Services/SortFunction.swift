//
//  SortFunction.swift
//  WTC!
//
//  Created by Gokul Nair on 26/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import Foundation


import Foundation

//TYPES OF SORT FOR TableView
enum SortType{
    case name(state : Bool)
    case time
    case calories
    case protein
    case state(state : Bool)
    
    var stringValue : String {
        switch self {
        case .time:
            return "Deaths"
        case .name(state: let state):
            return state ? "Name (A - Z)" : "Name (Z - A)"
        case .calories:
            return "Recovered "
        case .protein:
            return  "Total"
        case .state(let state):
            return state ? "Lowest First" : "Highest First"
        }
    }
}
