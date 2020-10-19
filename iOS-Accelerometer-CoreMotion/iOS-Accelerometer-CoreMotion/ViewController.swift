//
//  ViewController.swift
//  iOS-Accelerometer-CoreMotion
//
//  Created by Ovidiu Moldovan on 10/11/2019.
//  Copyright © 2019 Ovidiu Moldovan. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xAccel: UITextField!
    @IBOutlet weak var yAccel: UITextField!
    @IBOutlet weak var zAccel: UITextField!
    var motion = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myGyro()
    }

    func myAccelerometer(){
        motion.accelerometerUpdateInterval = 0.1
        motion.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData = data{
                self.view.reloadInputViews()
                let x = trueData.acceleration.x;
                let y = trueData.acceleration.y;
                let z = trueData.acceleration.z;
                self.xAccel.text = "x: \(Double(x))"
                self.yAccel.text = "y: \(Double(y))"
                self.zAccel.text = "z: \(Double(z))"
            }
        }
    }
        func myGyro(){
            self.motion.gyroUpdateInterval = 0.1
            self.motion.startGyroUpdates(to: OperationQueue.current!){ (data, error) in
            
                print(data as Any)
                
                if let trueData = data{
                    self.view.reloadInputViews()
                    let x = trueData.rotationRate.x
                    let y = trueData.rotationRate.y
                    let z = trueData.rotationRate.z
                    
                    
                    self.xAccel.text = "x: \(Double(x).rounded(toPlaces: 3))"
                    self.yAccel.text = "y: \(Double(y).rounded(toPlaces: 3))"
                    self.zAccel.text = "z: \(Double(z).rounded(toPlaces: 3))"
                }
            }
            
        }

    }

    extension Double{
        func rounded(toPlaces places: Int) -> Double{
            let divisor = pow(10.0, Double(places))
            return (self*divisor).rounded() / divisor
        }
    }
    


