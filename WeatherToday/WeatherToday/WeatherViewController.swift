//
//  ViewController.swift
//  WeatherToday
//
//  Created by 오동규 on 2022/08/23.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let firstCellIdentifier: String = "firstCell"


    let flag = ["flag_de", "flag_fr", "flag_it", "flag_jp", "flag_kr", "flag_us"]
    let nation: [String] = ["독일", "프랑스", "이탈리아", "일본", "한국", "미국"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.title = "세계 날씨"
        self.navigationController?.navigationBar.backgroundColor = UIColor.systemYellow
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! countryTableViewCell
         
        cell.flagImageView.image = UIImage(named: flag[indexPath.row])
        cell.nationLabel.text = nation[indexPath.row]
         
         return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: CountryViewController =
                segue.destination as? CountryViewController else {
            return
        }
        
        guard let cell: countryTableViewCell = sender as? countryTableViewCell else {
            return
        }
        
        nextViewController.selectedCountry = cell.nationLabel?.text
    }
}

