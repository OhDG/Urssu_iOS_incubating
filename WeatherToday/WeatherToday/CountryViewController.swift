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
        
        
        
        enum Country: String {
            case 독일 = "de"
            case 프랑스 = "fr"
            case 이탈리아 = "it"
            case 일본 = "jp"
            case 한국 = "kr"
            case 미국 = "us"
        }
        
        switch selectedCountry
        {
        case "독일":
            decodingJsonData(Country.독일.rawValue)
        case "프랑스":
            decodingJsonData(Country.프랑스.rawValue)
        case "이탈리아":
            decodingJsonData(Country.이탈리아.rawValue)
        case "일본":
            decodingJsonData(Country.일본.rawValue)
        case "한국":
            decodingJsonData(Country.한국.rawValue)
        default:
            decodingJsonData(Country.미국.rawValue)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.title = self.selectedCountry
    }
    
    
    
    func decodingJsonData(_ country: String) {
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? cityTableViewCell else {
            return UITableViewCell()
        }

        let city: City = self.cities[indexPath.row]
        
        
        enum RainState: Int {
            case clean = 0
            case little = 30
            case heavy = 60
        }
        
        switch city.rainfall_probability
        {
        case RainState.clean.rawValue...RainState.little.rawValue:
            cell.weatherImageView?.image = UIImage(named: "sunny")
            cell.weatherToday = "맑음"
        case (RainState.little.rawValue+1)...RainState.heavy.rawValue:
            cell.weatherImageView?.image = UIImage(named: "cloudy")
            cell.weatherToday = "흐림"
        default:
            cell.weatherImageView?.image = UIImage(named: "rainy")
            cell.weatherToday = "비"
            cell.probabilityOfRainfallLabel.textColor = UIColor.orange
        }
        
        
        cell.cityLabel?.text = city.city_name
        cell.tempLabel?.text = "섭씨 \(city.celsius)도 / 화씨 \(city.state)도"
        if city.celsius <= 10 {
            cell.tempLabel.textColor = UIColor.blue
        }
        cell.probabilityOfRainfallLabel?.text = "강수확률 \(city.rainfall_probability)%"

         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
