//
//  ThirdViewController.swift
//  WeatherToday
//
//  Created by 오동규 on 2022/08/30.
//

import UIKit

class CityViewController: UIViewController {

    
    var selectedCity: String?
    var selectedWeatherImage: UIImage?
    var selectedTemp: String?
    var selectedProbabilityOfRainfall: String?
    var selectedWeatherToday: String?
    
    
    @IBOutlet var thirdWeatherImageView: UIImageView!
    @IBOutlet var thirdWeatherLabel: UILabel!
    @IBOutlet var thirdTempLabel: UILabel!
    @IBOutlet var thirdProbabilityOfRainfallLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thirdWeatherImageView.image = selectedWeatherImage
        thirdTempLabel.text = selectedTemp
        thirdProbabilityOfRainfallLabel.text = selectedProbabilityOfRainfall
        thirdWeatherLabel.text = selectedWeatherToday
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = self.selectedCity
    }
    
   
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


