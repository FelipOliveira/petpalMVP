//
//  MeusPetsTableViewController.swift
//  petpalMvp
//
//  Created by student on 03/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class MeusPetsTableViewController: UITableViewController {

    var ListaPets = [Pets]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListaPets = PetsDAO.getPets()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ListaPets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meusPetsCell", for: indexPath)

        if let ListaPetsCell = cell as? MeusPetsTableViewCell{
            let lista = ListaPets[indexPath.row]
            
            ListaPetsCell.nomePetUILabel.text = lista.nomePet
            ListaPetsCell.racaPetUILabel.text = lista.racaPet
            ListaPetsCell.imageUI.image = UIImage(named: lista.imagemPet)
            
            return ListaPetsCell
        }

        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalheView = segue.destination as? PetDetalhesViewController{
            //detalheView.nomePetUILabel.text = lista.nomePet
            //detalheView.imagemArtistaDetalhe = UIImage(named: imagemArtista)
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
