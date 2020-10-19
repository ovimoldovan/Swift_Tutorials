//
//  AccelerometerView.swift
//  grabSensorDataTest WatchKit Extension
//
//  Created by Ovidiu Moldovan on 03/11/2019.
//  Copyright © 2019 Ovidiu Moldovan. All rights reserved.
//

import CoreMotion
class AccelerometerView{
let motion = CMMotionManager()
    var timer: Timer
    init(){
        
    }

func startAccelerometers() {
   // Make sure the accelerometer hardware is available.
   if self.motion.isAccelerometerAvailable {
      self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
      self.motion.startAccelerometerUpdates()

      // Configure a timer to fetch the data.
      self.timer = Timer(fire: Date(), interval: (1.0/60.0),
            repeats: true, block: { (timer) in
         // Get the accelerometer data.
         if let data = self.motion.accelerometerData {
            let x = data.acceleration.x
            let y = data.acceleration.y
            let z = data.acceleration.z

            // Use the accelerometer data in your app.
         }
      })

      // Add the timer to the current run loop.
      RunLoop.current.add(self.timer!, forMode: .defaultRunLoopMode)
   }
}
}
