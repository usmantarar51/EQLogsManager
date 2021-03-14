//
//  ViewController.swift
//  LogsManagerTest
//
//  Created by Usman Tarar on 3/15/21.
//

import UIKit
import LogsManager


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getLocation()
    }
    
    func getLocation() {
        LocationManager.shared.getLocation { (location, error) in
            if let err = error {
                print(err)
                self.logLocation(lat: 0, lon: 0)
            } else {
                self.logLocation(lat: location?.coordinate.latitude ?? 0, lon: location?.coordinate.longitude ?? 0)
            }
        }
    }
    
    func logLocation(lat: Double = 0.0, lon: Double = 0.0) {
        LogsManager.init().log(api: "https://httpbin.org/post", lat: lat, lon: lon) { (result, error) in
            print(result ?? "")
        }
    }


}

