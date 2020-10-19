//
//  InterfaceController.swift
//  iOS-Accelerometer-CoreMotion WatchKit Extension
//
//  Created by Ovidiu Moldovan on 10/11/2019.
//  Copyright © 2019 Ovidiu Moldovan. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var xAccel: WKInterfaceTextField!
    @IBOutlet weak var yAccel: WKInterfaceTextField!
    @IBOutlet weak var zAccel: WKInterfaceTextField!
    
    var motion = CMMotionManager()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        myAccelerometer()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func myAccelerometer(){
        motion.accelerometerUpdateInterval = 0.1
        motion.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let trueData = data{
                //self.view.reloadInputViews()
                let x = trueData.acceleration.x;
                let y = trueData.acceleration.y;
                let z = trueData.acceleration.z;
                self.xAccel.setText("x: \(Double(x))")
                self.yAccel.setText("y: \(Double(y))")
                self.zAccel.setText("z: \(Double(z))")
            }
        }
    }

}
