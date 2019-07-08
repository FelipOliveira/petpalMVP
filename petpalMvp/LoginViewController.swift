//
//  LoginViewController.swift
//  petpalMvp
//
//  Created by student on 06/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoUI: UIImageView!
    @IBOutlet weak var senhaUserUI: UITextField!
    @IBOutlet weak var nomeUserUI: UITextField!
    
    @IBAction func EntrarButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        logoUI.layer.borderWidth = 1
        logoUI.layer.masksToBounds = false
        logoUI.layer.borderColor = UIColor.black.cgColor
        logoUI.layer.cornerRadius = logoUI.frame.height/2
        logoUI.clipsToBounds = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddPetViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
