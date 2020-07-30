//
//  TableViewCell.swift
//  WTC!
//
//  Created by Gokul Nair on 05/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var calloriesLabel: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    
}
