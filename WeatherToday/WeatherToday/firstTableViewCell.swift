//
//  firstTableViewCell.swift
//  WeatherToday
//
//  Created by 오동규 on 2022/08/25.
//

import UIKit

class firstTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var flagImageView : UIImageView!
    @IBOutlet var nationLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
