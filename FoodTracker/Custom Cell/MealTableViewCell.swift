//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by dinhphu98 on 4/5/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var ratingControl: RatingController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
