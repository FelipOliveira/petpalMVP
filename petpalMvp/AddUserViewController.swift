//
//  AddUserViewController.swift
//  petpalMvp
//
//  Created by student on 08/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var repeteAddSenhaUser: UITextField!
    @IBOutlet weak var addSenhaUser: UITextField!
    @IBOutlet weak var addEmailUser: UITextField!
    @IBOutlet weak var addNomeUser: UITextField!
    @IBAction func NovoUserButton(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddPetViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
