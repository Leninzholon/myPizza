//
//  MyPizzaTableViewCell.swift
//  myPizza
//
//  Created by  zholon on 03.01.2021.
//

import UIKit

class MyPizzaTableViewCell: UITableViewCell {
  
    @IBOutlet weak var thumbanailImageView: UIImageView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var structureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
