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
    
    var compareBtn1: Bool!
    var compareBtn2: Bool!
    
    
    
    @IBAction func touchUpNext(_ sender: UIButton) {
        UserInformation.shared.id = idField.text
        UserInformation.shared.password = pwField.text
    }
    
    func completionBtn() {
        if compareBtn1 && compareBtn2 == true {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if ( idField.text?.isEmpty == false ) && ( pwField.text?.isEmpty == false ) == true {
            self.compareBtn1 = true
            completionBtn()
        } else {
            self.compareBtn1 = false
            completionBtn()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if introField.text.isEmpty {
            self.compareBtn2 = false
            completionBtn()
        } else {
            self.compareBtn2 = true
            completionBtn()
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
        
        self.nextButton.isEnabled = false
        self.idField.delegate = self
        self.pwField.delegate = self
        self.introField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
