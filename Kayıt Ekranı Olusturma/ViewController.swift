//
//  ViewController.swift
//  Kayıt Ekranı Olusturma
//
//  Created by Ertuğrul Kulaber on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surNameTextField: UITextField!
    @IBOutlet weak var birtdayTextField: UITextField!
    
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var birtdayLabel: UILabel!
    @IBOutlet weak var sonucLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
      }

    @IBAction func saveButton(_ sender: Any) {
        
       
        
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(surNameTextField.text!, forKey: "surname")
        UserDefaults.standard.set(birtdayTextField.text!, forKey: "birtday")
        nameLabel.text = "NAME : \(String(nameTextField.text!))"
        surnameLabel.text = "SURNAME : \(String(surNameTextField.text!))"
        birtdayLabel.text = "AGE : \(String(birtdayTextField.text!))"
        let age = Int(birtdayTextField.text!)!
        if age < 18 {
            sonucLabel.text = "You must be over the age of 18 :/ "
            
        } else if age > 18 && age < 35  {
            let alertController = UIAlertController(title: "KAYDINIZ OLUŞTURULDU", message: "HOŞGELDİNİZ", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "CANCEL", style: .cancel){ action in
                print("İptal Tiklandı")
            }
            alertController.addAction(iptalAction)
        self.present(alertController, animated: true)
            
            sonucLabel.text = "Your registration has been created :) "
        } else if  age > 35 {
            sonucLabel.text = "INVALID AGE :/ "
            nameLabel.text = "NAME : "
            surnameLabel.text = "SURNAME : "
            birtdayLabel.text = "AGE : "
        }
        }
    
    @IBAction func deleteButton(_ sender: Any) {
    
        let deletname = UserDefaults.standard.object (forKey: "name")
        let deletSurName = UserDefaults.standard.object (forKey: "surname")
        let deletbirtDay = UserDefaults.standard.object (forKey: "birtday")
        
        if (deletname as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "NAME : "
        }
        if (deletSurName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "surname")
            surnameLabel.text = "SURNAME : "
        }
        if (deletbirtDay as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birtday")
            birtdayLabel.text = "AGE : "
        }
    }
    
}

