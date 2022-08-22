//
//  SecondViewController.swift
//  SignUp
//
//  Created by 오동규 on 2022/08/02.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    } ()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var introField: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkPwField: UITextField!
    
    
    var isPwFieldFilled1: Bool = false
    var isPwFieldFilled2: Bool = false

    var isBothPwFieldFilled: Bool = false
    var isIntroFieldFilled: Bool = false
    
    
    
    @IBAction func touchUpNext(_ sender: UIButton) {
        UserInformation.shared.id = idField.text
        UserInformation.shared.password = pwField.text
    }
    
    
    
    
    func isPwFieldmatched() {
        if isPwFieldFilled1 && isPwFieldFilled2 {
            self.isBothPwFieldFilled = true
        } else {
            self.isBothPwFieldFilled = false
        }
        completion()
    }
    
    func completion() {
        if isBothPwFieldFilled && isIntroFieldFilled {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
   
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if ( idField.text?.isEmpty == false ) && ( pwField.text?.isEmpty == false ) == true {
            self.isPwFieldFilled1 = true
        } else {
            self.isPwFieldFilled1 = false
        }
        isPwFieldmatched()
        
        if ( pwField.text == checkPwField.text ) {
            self.isPwFieldFilled2 = true
        } else {
            self.isPwFieldFilled2 = false
        }
        isPwFieldmatched()
        
    }
   
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    

    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if introField.text.isEmpty {
            self.isIntroFieldFilled = false
        } else {
            self.isIntroFieldFilled = true
        }
        completion()
        
        if textView.text.isEmpty {
            textView.text = "자기소개를 입력하세요"
            textView.textColor = UIColor.lightGray
            }
    }
      
    


    
    
    
    @IBAction func tapGestureRecognizer(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)

    }
    
//    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
//        self.present(self.imagePicker, animated: true, completion: nil)
//    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "defaultImage")
        self.nextButton.isEnabled = false
        self.idField.delegate = self
        self.pwField.delegate = self
        self.checkPwField.delegate = self
        self.introField.delegate = self
        
        func textFieldPlaceHolderSetting() {
            introField.text = "자기소개를 입력하세요"
            introField.textColor = UIColor.lightGray
        }
        textFieldPlaceHolderSetting()
        
        
    }

    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
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
