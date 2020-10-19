//
//  CircleImage.swift
//  testSensors
//
//  Created by Ovidiu Moldovan on 02/11/2019.
//  Copyright © 2019 Ovidiu Moldovan. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("florin")
            .frame(width: 400)
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
