//
//  ViewController.swift
//  TabGesture
//
//  Created by 오동규 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self

        self.view.addGestureRecognizer(tapGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}

