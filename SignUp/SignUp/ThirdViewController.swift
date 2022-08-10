//
//  ThirdViewController.swift
//  SignUp
//
//  Created by 오동규 on 2022/08/02.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pnumField: UITextField!
    @IBOutlet weak var joinBtn: UIButton!
    
    
    
    
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
        pnumField.text = UserInformation.shared.pnum
        dateLabel.text = UserInformation.shared.birth
        self.joinBtn.isEnabled = false
        self.pnumField.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if ( pnumField.text?.isEmpty == false ) && ( dateLabel.text?.isEmpty == false ) == true {
            self.joinBtn.isEnabled = true
        } else {
            self.joinBtn.isEnabled = false
        }
    }
    
    
    
    
    
    
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
        UserInformation.shared.pnum = pnumField.text
        UserInformation.shared.birth = dateLabel.text
    }
    
    @IBAction func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
        UserInformation.shared.id = nil
        UserInformation.shared.password = nil
        UserInformation.shared.pnum = nil
        UserInformation.shared.birth = nil
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
