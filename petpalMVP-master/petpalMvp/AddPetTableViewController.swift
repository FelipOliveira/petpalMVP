//
//  AddPetTableViewController.swift
//  petpalMvp
//
//  Created by student on 04/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class AddPetTableViewController: UITableViewController {

    @IBOutlet weak var nomePetCadastro: UITextField!
    @IBOutlet weak var especiePetCadastro: UITextField!
    @IBOutlet weak var NascimentoPetCadastro: UITextField!
    @IBOutlet weak var pesoPetCadastro: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

}

