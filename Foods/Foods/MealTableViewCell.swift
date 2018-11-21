//
//  MealTableViewCell.swift
//  Foods
//
//  Created by Péter Kulcsár Szabó on 10/11/2018.
//  Copyright © 2018 Péter Kulcsár Szabó. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
