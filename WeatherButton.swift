//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Dipesh raj joshi on 04/01/24.
//

import Foundation
import SwiftUI
struct WeatherButton: View {
    
    var title :String
    
    
    var body: some View {
        Text(title)
            .frame(width: 280,height: 50)
            .background(Color.white)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
    }
}
