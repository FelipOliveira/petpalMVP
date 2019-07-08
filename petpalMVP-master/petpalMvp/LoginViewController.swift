//
//  LoginViewController.swift
//  petpalMvp
//
//  Created by student on 06/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //@IBOutlet weak var appIcom: UIImageView!
    @IBOutlet weak var logoUI: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        logoUI.layer.borderWidth = 1
        logoUI.layer.masksToBounds = false
        logoUI.layer.borderColor = UIColor.black.cgColor
        logoUI.layer.cornerRadius = logoUI.frame.height/2
        logoUI.clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
