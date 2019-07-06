//
//  SensorViewController.swift
//  petpalMvp
//
//  Created by student on 05/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class SensorViewController: UIViewController {

    var pets:Pets?
    
    @IBOutlet weak var bpmUILabel: UILabel!
    @IBOutlet weak var valorMinimoUILabel: UILabel!
    @IBOutlet weak var valorMaximoUILabel: UILabel!
    @IBOutlet weak var valorMedioUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="Coração do "+(self.pets?.nomePet)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
