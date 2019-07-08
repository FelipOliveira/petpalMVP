//
//  retrieveData.swifts
//
//  Created by student on 03/07/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class Reading {
    var bpm = Array<Float>()
    
    init(jsonReading: [[String:String]]) {
        
        let sortedReading = jsonReading.sorted { $0["timestamp"]! > $1["timestamp"]! }
        
        print(sortedReading)
        
        var bpmArray = [String]()
        for reading in sortedReading {
            if reading["bpm"] != "inf"{
                bpmArray.append(reading["bpm"]!)
            }
        }
        
        print(bpmArray)
        self.bpm = bpmArray.map { Float ($0)!}
    }
}

func getBpmReadings(toRead: Int, callback: @escaping ((Reading) -> Void)){
    
    let endpoint: String = "https://scpetpal.mybluemix.net/getBpm"
    
    let url = URL(string: endpoint)
    
    let urlRequest = URLRequest(url: url!)
    
    let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
        
        if error != nil {
            print("Error = \(String(describing: error))")
            return
        }
        
        let responseString = String(data: data!, encoding: String.Encoding.utf8)
        print("responseString = \(String(describing: responseString))")
        
        DispatchQueue.main.async() {
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                    
                    var bpmReading = [[String:String]]()
                    
                    //'json.count' vai armazenar localmente tudo que tem no banco.
                    var amount = toRead
                    if amount == 0 { amount = json.count }
                    for index in 0..<amount {
                        
                        let jsonBPM = json[index]["data"]?["BPM"] as? String ?? ""
                        let jsonTimeStamp = json[index]["timestamp"] as? String ?? ""
                        
                        let readDict = ["bpm":jsonBPM, "timestamp":jsonTimeStamp]
                        
                        bpmReading.append(readDict)

                    }
                    
                    let reading = Reading(jsonReading: bpmReading)

                    callback(reading)
                    
                }else {
                    
                    print("fudeuuuu")
                }
            } catch let error as NSError {
                print("Error = \(error.localizedDescription)")
            }
        }

        
    })
    
    task.resume()
    
}
