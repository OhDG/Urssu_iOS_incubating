//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 오동규 on 2022/08/28.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var secondTableView: UITableView!
        
    let secondCellIdentifier: String = "secondCell"

    var cities: [City] = []
    
    var selectedCountry: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.secondTableView.delegate = self
        self.secondTableView.dataSource = self
        
        switch selectedCountry
        {
        case "독일":
            decodingJsonData(country: "de")
        case "프랑스":
            decodingJsonData(country: "fr")
        case "이탈리아":
            decodingJsonData(country: "it")
        case "일본":
            decodingJsonData(country: "jp")
        case "한국":
            decodingJsonData(country: "kr")
        default:
            decodingJsonData(country: "us")
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.title = self.selectedCountry
    }
    
    
    
    func decodingJsonData(country: String) {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: country) else {
            return
        }
        
        do {
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.secondTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! cityTableViewCell

        let city: City = self.cities[indexPath.row]
        
        
        switch city.rainfall_probability
        {
        case 0...30:
            cell.weatherImageView?.image = UIImage(named: "sunny")
            cell.weatherToday = "맑음"
        case 31...60:
            cell.weatherImageView?.image = UIImage(named: "cloudy")
            cell.weatherToday = "흐림"
        default:
            cell.weatherImageView?.image = UIImage(named: "rainy")
            cell.weatherToday = "비"
        }
                
        cell.cityLabel?.text = city.city_name
        cell.tempLabel?.text = "섭씨 \(city.celsius)도 / 화씨 \(city.state)도"
        cell.probabilityOfRainfallLabel?.text = "강수확률 \(city.rainfall_probability)%"

         return cell
        

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: CityViewController =
                segue.destination as? CityViewController else {
            return
        }
        
        guard let cell: cityTableViewCell = sender as? cityTableViewCell else {
            return
        }
        
        
        nextViewController.selectedCity = cell.cityLabel?.text
        
        nextViewController.selectedWeatherImage = cell.weatherImageView?.image
        nextViewController.selectedWeatherToday = cell.weatherToday
        nextViewController.selectedTemp = cell.tempLabel?.text
        nextViewController.selectedProbabilityOfRainfall = cell.probabilityOfRainfallLabel?.text
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
