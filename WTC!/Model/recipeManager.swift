//
//  recipeManager.swift
//  WTC!
//
//  Created by Gokul Nair on 03/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


protocol RecipeManagerDelegate {
    func didUpdateRecipe( _ RecipeManager: recipeManager, model: jsonModel, Info: info)
    func didFailWithError(error: Error)
}

class recipeManager {
    let RecipeUrl1 = "https://api.edamam.com/search?"
    let RecipeUrl2 = "&app_id=338e868b&app_key=ea92d40a6a74c127a7fa152e488cc73a%20&from=0&to=100&calories=591-722&health=alcohol-free"
    // inside the url add numers between 0-100 according to the results you need to fetch.(max 100 only)
    let RecipeUrlForNutrition = "https://api.edamam.com/api/nutrition-data?app_id=a4ae5438&app_key=53ee99a55101f5ac58596f1f0f37e6fd"
    
    var delegate: RecipeManagerDelegate?
    var arrData = [jsonModel]()
    weak var model: MainViewController?
    weak var nutri: nutrientsViewController?
    //MARK:- Nutrition chart for recepi api
    var itemName = [item]()
    var infoData = [info]()
    var infoDataF = [infoF]()
    var infoDataW = [infoW]()
    var infoDataS = [infoS]()
    var infoDataP = [infoP]()
    var infoDataC = [infoC]()
    //MARK:- nutrition chart for nutretion api
    
    var nutriHlthData = [HlthLabel]()
    var nutriDataE = [NutriEnergy]()
    var nutriDataF = [NutriFat]()
    var nutriDataW = [NutriWater]()
    var nutriDataS = [NutriSugar]()
    var nutriDataP = [NutriPro]()
    var nutriDataC = [NutriCho]()
    var cautiondata = [cautions]()
    var dietData = [dietLabels]()
    var caloriData = [calories]()
    
    
    
    func jsonParsing(ingredient: String) { 
        
          let urlString = URL(string:"\(RecipeUrl1)q=\(ingredient)\(RecipeUrl2)")
        URLSession.shared.dataTask(with: urlString!){(data, response, error) in 
            guard let data = data else {return}
           
            do {
                let json = try JSON(data:data)
                
                //MARK:- made different array to store info outside of API data
                let q = json["q"]
                self.itemName.append(item(json: q))
                self.infoData.removeAll()
                self.arrData.removeAll()
                
                print(q)
                //print(self.infoData)
                //MARK:- made array to store data related to recipe search
                
                let hits = json["hits"]
                for arr in hits.arrayValue {
                    let recipe = arr["recipe"]
                    self.arrData.append(jsonModel(json: recipe))
                    let energy = arr["recipe"]["totalNutrients"]["ENERC_KCAL"] //For ennergy label
                    self.infoData.append(info(json: energy))
                    let fat = arr["recipe"]["totalNutrients"]["FAT"] //For ennergy label
                    self.infoDataF.append(infoF(json: fat))
                    let sugar = arr["recipe"]["totalNutrients"]["SUGAR"] //For sugar label
                    self.infoDataS.append(infoS(json: sugar))
                    let chole = arr["recipe"]["totalNutrients"]["CHOLE"] //For chole label
                    self.infoDataC.append(infoC(json: chole))
                    let procnt = arr["recipe"]["totalNutrients"]["PROCNT"] //For procnt label
                    self.infoDataP.append(infoP(json: procnt))
                    let water = arr["recipe"]["totalNutrients"]["WATER"] //For ennergy label
                    self.infoDataW.append(infoW(json: water))
                   
                    DispatchQueue.main.async {
                        
                        self.model?.tableView.reloadData()
                        self.model?.tableView.reloadSectionIndexTitles()
                        self.model?.tableView.reloadInputViews()
                        
                    }
                }
                print(self.infoDataP)
                
            }catch{
                self.model?.didFailWithError(error: error)
               
            }
            
        }.resume()
    }
    
    func jsonParsingNutrition(ingredient: String) {
        
        let urlString = URL(string:"\(RecipeUrlForNutrition)&ingr=\(ingredient)")
        URLSession.shared.dataTask(with: urlString!){(data, response, error) in
            guard let data = data else {return}
            
            do {
                let json = try JSON(data:data)
                
                self.caloriData.removeAll()
                self.nutriDataE.removeAll()
                self.nutriDataS.removeAll()
                self.nutriDataC.removeAll()
                self.nutriDataF.removeAll()
                self.nutriDataW.removeAll()
                self.nutriHlthData.removeAll()
                self.dietData.removeAll()
                self.cautiondata.removeAll()
                self.nutriDataP.removeAll()
                
                
                let HlthLabels = json["healthLabels"]
               // self.nutriHlthData.append(HlthLabel(json: HlthLabels))
                let Calories = json["calories"]
                self.caloriData.append(calories(json:Calories))
                let DietLabels = json["dietLabels"]
                //self.dietData.append(dietLabels(json: DietLabels))
                let Cautions = json["cautions"]
               // self.cautiondata.append(cautions(json: Cautions))
                let energy = json["totalNutrients"]["ENERC_KCAL"]
                self.nutriDataE.append(NutriEnergy(json:energy))
                let fat = json["totalNutrients"]["FAT"]
                self.nutriDataF.append(NutriFat(json:fat))
                let cho = json["totalNutrients"]["CHOLE"]
                self.nutriDataC.append(NutriCho(json:cho))
                let pro = json["totalNutrients"]["PROCNT"]
                self.nutriDataP.append(NutriPro(json:pro))
                let sugar = json["totalNutrients"]["SUGAR"]
                self.nutriDataS.append(NutriSugar(json:sugar))
                let water = json["totalNutrients"]["WATER"]
                self.nutriDataW.append(NutriWater(json:water))
                
                DispatchQueue.main.async {
                    
                    self.nutri?.relodeData()
                    
                }
                print(self.nutriHlthData)
                print(self.caloriData)
                print(self.nutriDataC)
                print(self.nutriDataS)
                print(self.nutriDataE)
                print(self.nutriDataP)
                print(self.nutriDataW)
            }
            
            catch {
                print(error.localizedDescription)
            }
        }.resume()
         
}


}

