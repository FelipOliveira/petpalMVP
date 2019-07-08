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
    
    @IBOutlet weak var BPMUIButton: UIButton!
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
        coracaoUI.image = #imageLiteral(resourceName: "coração")
        
        title = self.pets?.nomePet
        
        let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateBPM), userInfo: nil, repeats: true)
        
        updateBPM()
        
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
