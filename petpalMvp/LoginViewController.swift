//
//  LoginViewController.swift
//  petpalMvp
//
//  Created by student on 06/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var appIcom: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //appIcom.layer.borderWidth = 1
        appIcom.layer.masksToBounds = false
        appIcom.layer.borderColor = UIColor.black.cgColor
        appIcom.layer.cornerRadius = appIcom.frame.height/2
        appIcom.clipsToBounds = true
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
