//
//  secondTableViewCell.swift
//  WeatherToday
//
//  Created by 오동규 on 2022/08/28.
//

import UIKit

class secondTableViewCell: UITableViewCell {

    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var probabilityOfRainfallLabel: UILabel!
    
    var weatherToday: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
