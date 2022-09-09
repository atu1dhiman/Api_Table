//
//  TouristTableViewCell.swift
//  Api_Table
//
//  Created by Atul Dhiman on 29/08/22.
//

import UIKit

class TouristTableViewCell: UITableViewCell {

    @IBOutlet weak var touristemail: UILabel!
    @IBOutlet weak var touristnameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
