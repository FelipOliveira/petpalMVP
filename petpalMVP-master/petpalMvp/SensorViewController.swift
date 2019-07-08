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
    
    func getMed(data: Array<Float>) -> Float{
        
        var med: Float = 0
        for bpm in data{
            med += bpm
        }
        med = med/Float(data.count)
        return med
        
    }
    
    func getMin(data: Array<Float>) -> Float{
        
        var min = data[0]
        
        for bpm in data{
            
            if min > bpm{
                min = bpm
            }
        }
        
        return min
        
    }
    
    func getMax(data: Array<Float>) -> Float{
        
        var max: Float = 0.0
        
        for bpm in data{
            
            if max < bpm{
                max = bpm
                
            }
            
        }
        
        return max
        
    }
    
    func updateBPM () {
        getBpmReadings(toRead: 0) { (reading) in
            self.bpmUILabel.text = "BPM: " + String(reading.bpm[0])
            self.valorMinimoUILabel.text = String(self.getMin(data: reading.bpm))
            self.valorMaximoUILabel.text = String(self.getMax(data: reading.bpm))
            self.valorMedioUILabel.text = String(self.getMed(data: reading.bpm))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="Coração do "+(self.pets?.nomePet)!
        // Do any additional setup after loading the view.
        
        let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateBPM), userInfo: nil, repeats: true)
        
        updateBPM()
        
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
