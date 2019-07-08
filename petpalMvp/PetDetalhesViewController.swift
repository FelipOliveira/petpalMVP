//
//  PetDetalhesViewController.swift
//  petpalMvp
//
//  Created by student on 03/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class PetDetalhesViewController: UIViewController {

    //@IBOutlet weak var nomePetUILabel: UILabel!
    @IBOutlet weak var RacaPetUILabel: UILabel!
    @IBOutlet weak var NascimentoPetUILabel: UILabel!
    @IBOutlet weak var PesoPetUILabel: UILabel!
    
    @IBOutlet weak var coracaoUI: UIImageView!
    
    var pets: Pets?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.nomePetUILabel.text = self.pets?.nomePet
        self.RacaPetUILabel.text = self.pets?.racaPet
        self.NascimentoPetUILabel.text = self.pets?.nascimentoPet
        self.PesoPetUILabel.text = (self.pets?.pesoPet)! + "Kg"
        coracaoUI.image = #imageLiteral(resourceName: "coração")
        
        title = self.pets?.nomePet
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalheView = segue.destination as? SensorViewController{
            detalheView.pets = pets
        }
    
    }


}
