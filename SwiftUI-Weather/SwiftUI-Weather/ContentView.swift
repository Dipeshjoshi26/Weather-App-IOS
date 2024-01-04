//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Dipesh raj joshi on 02/01/24.
//

import SwiftUI
import SwiftData

struct ContentView: View{
    //struct is created and destroyed
    
    @State private var isNight = false; //put of somewhere else , keep stayed
    
    
    var body: some View{
        ZStack{
            BackgroundView(isNight: $isNight)
            
            VStack(){
                CityTextView(cityName: "Cupertino,CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill":
                                        "cloud.sun.fill", tempreature:76)
                
                
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName:"cloud.sun.fill",
                                   tempreature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName:"sun.snow.fill",
                                   tempreature: 10)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName:"sun.haze.fill",
                                   tempreature: 16)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName:"sun.rain.fill",
                                   tempreature: 66)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName:"sun.dust.fill",
                                   tempreature: 55)
                    
                }
                
                Spacer()
                
//       button
                Button{
                    isNight.toggle() //change the boolean
//                    print("tapped")
                }label: {
                    Text("Change Day Time")
                        .frame(width: 280,height: 50)
                        .background(Color.white)
                        .font(.system(size: 20,weight: .bold,design: .default))
                        .cornerRadius(10)
                }
                
                Spacer()
                
            
                
                
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var tempreature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            
            Text("\(tempreature)°")//using option+shift+8 degree symbol
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
//    var topColor:Color
//    var bottomColor:Color
    var body: some View {
       
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
//                    .background(Color.red)
//                    .frame(width: 200,height: 200)
            .padding()
        
    }
    
}

struct MainWeatherStatusView :View {
    var imageName: String
    var tempreature: Int
    
    var body: some View {
        VStack(spacing:10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("\(tempreature)°")//using option+shift+8 degree symbol
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
            
        }
        .padding(.bottom,40)
    }
}

//struct WeatherButton: View {
//    
//    var title :String
//    
//    
//    var body: some View {
//        Text(title)
//            .frame(width: 280,height: 50)
//            .background(Color.white)
//            .font(.system(size: 20,weight: .bold,design: .default))
//            .cornerRadius(10)
//    }
//}
