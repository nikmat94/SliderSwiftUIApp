//
//  ContentView.swift
//  SliderSwiftUIApp
//
//  Created by Никита  on 04.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = 50.0
    @State private var blueValue = 50.0
    @State private var greenValue = 50.0
    
    @State private var redValueLabel = ""
    @State private var blueValueLabel = ""
    @State private var greenValueLabel = ""
    
    @State private var displayedLabel = ""
    @State private var alertPresented = false
    
    var body: some View {
        
        VStack(spacing: -30){
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 100, alignment: .center)
                .padding(150)
                .foregroundColor(Color.init(UIColor.init(displayP3Red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)) )
                
            HStack{
                Text("\(lround(redValue))")
                    .frame(width: 35, height: 35)
                Slider(value: $redValue, in: 0...255, step: 1)
                    .colorMultiply(.red)
                    .frame(width: 290, height: 100)
                TextField("\(lround(redValue))", text: $redValueLabel, onCommit:  {
                    displayedLabel = String(redValue)
                    redValue = checkValue(value: redValueLabel)
                    redValueLabel = ""
                })
                .alert(isPresented: $alertPresented, content: {
                    Alert(title: Text("Wrong format!"), message: Text("Enter number in 0 to 255"), dismissButton: Alert.Button.cancel())
                })
            }

            HStack{
                Text("\(lround(blueValue))")
                    .frame(width: 35, height: 100)
                Slider(value: $blueValue, in: 0...255, step: 1)
                    .colorMultiply(.blue)
                    .frame(width: 290, height: 100)
                TextField("\(lround(blueValue))", text: $blueValueLabel, onCommit:  {
                    displayedLabel = String(blueValue)
                    blueValue = checkValue(value: blueValueLabel)
                    blueValueLabel = ""
                })
                .alert(isPresented: $alertPresented, content: {
                    Alert(title: Text("Wrong format!"), message: Text("Enter number in 0 to 255"), dismissButton: Alert.Button.cancel())
                })
            }

            HStack{
                Text("\(lround(greenValue))")
                    .frame(width: 35, height: 100)
                Slider(value: $greenValue, in: 0...255, step: 1)
                    .colorMultiply(.green)
                    .frame(width: 290, height: 100)
                TextField("\(lround(greenValue))", text: $greenValueLabel, onCommit:  {
                    displayedLabel = String(greenValue)
                    greenValue = checkValue(value: greenValueLabel)
                    greenValueLabel = ""
                })
                .alert(isPresented: $alertPresented, content: {
                    Alert(title: Text("Wrong format!"), message: Text("Enter number in 0 to 255"), dismissButton: Alert.Button.cancel())
                })
            }
        }
    }
    
    private func checkValue(value: String) -> Double {
        if let newValue = Double(value),
           Double(value)! >= 0,
           Double(value)! <= 255 {
            return  newValue
        }
        alertPresented.toggle()
        return Double(displayedLabel)!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
