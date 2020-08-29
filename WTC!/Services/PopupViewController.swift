//
//  PopupViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 23/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import Kingfisher 

class PopupViewController: UIViewController {

    let haptic = haptickFeedback()
    
    @IBOutlet weak var recipeImage: UIImageView!
  
   
    
    var model: DetailRecipeVC?
    var models: jsonModel?
    var imageString : String!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // recipeImage.kf.setImage(with: URL(string: imageString))
        
        //recipeImage.kf.setImage(with: URL(string: models!.image))
        
        recipeImage.layer.cornerRadius = 10
    }
    

   // Code to dismiss ViewController by touching outside
      
      
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.dismiss(animated: true, completion: nil)
      }
      
}
