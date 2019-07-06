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
    
    var pets: Pets?
    
    func updateBPM () {
        getBpmReadings(toRead: 0) { (reading) in
            self.BPMUIButton.setTitle(String(describing: reading.bpm[0]), for: UIControlState.normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.nomePetUILabel.text = self.pets?.nomePet
        self.RacaPetUILabel.text = self.pets?.racaPet
        self.NascimentoPetUILabel.text = self.pets?.nascimentoPet
        self.PesoPetUILabel.text = (self.pets?.pesoPet)! + "Kg"
        
        let timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateBPM), userInfo: nil, repeats: true)
        
        updateBPM()
        
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
