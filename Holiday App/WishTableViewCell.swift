//
//  WishTableViewCell.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/10/20.
//

import UIKit

class WishTableViewCell: UITableViewCell {

    @IBOutlet weak var wishLabel: UILabel!
    @IBOutlet weak var wishNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
