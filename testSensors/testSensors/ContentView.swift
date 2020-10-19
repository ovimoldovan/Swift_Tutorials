//
//  ContentView.swift
//  testSensors
//
//  Created by Ovidiu Moldovan on 31/10/2019.
//  Copyright © 2019 Ovidiu Moldovan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                Text("Politicianul roman")
                    .font(.title)
                HStack {
                    Text("Palatul Parlamentului")
                        .font(.subheadline)
                    Spacer()
                    Text("Bucuresti")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

