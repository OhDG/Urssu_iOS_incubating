//
//  ThirdViewController.swift
//  SignUp
//
//  Created by 오동규 on 2022/08/02.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func popToRootJoin() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
