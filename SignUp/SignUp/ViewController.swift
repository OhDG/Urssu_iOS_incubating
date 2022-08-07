//
//  ViewController.swift
//  SignUp
//
//  Created by 오동규 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var mainidField: UITextField!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mainidField.text = UserInformation.shared.id
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainidField.text = UserInformation.shared.id
       }

}

