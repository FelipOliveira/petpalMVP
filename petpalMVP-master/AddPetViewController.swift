//
//  AddPetViewController.swift
//  petpalMvp
//
//  Created by student on 05/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class AddPetViewController: UIViewController {

    // MARK: - Properties
    var novoPet: Pets?

    @IBOutlet weak var nomePetCadastro: UITextField!
    @IBOutlet weak var especiePetCadastro: UITextField!
    @IBOutlet weak var nascimentoPetCadastro: UITextField!
    @IBOutlet weak var pesoPetCadastro: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddPetViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        title="Novo pet"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        let nomePet = nomePetCadastro.text
        let especiePet = especiePetCadastro.text
        let nascimentoPet = nascimentoPetCadastro.text
        let pesoPet = pesoPetCadastro.text
        if segue.identifier == "AddNovoPet" {
            //novoPet = Pets(nomePet: nomePetCadastro, racaPet: especiePetCadastro, nascimentoPet: nascimentoPetCadastro, pesoPet: pesoPetCadastro, imagemPet: "")
        }
    }

    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

extension AddPetViewController {
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
    }
}
