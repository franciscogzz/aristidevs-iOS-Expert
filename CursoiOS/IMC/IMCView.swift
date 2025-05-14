//
//  IMCView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 02/05/25.
//

import SwiftUI

struct IMCView: View {
    // El init es como el constructor, y se utiliza en este caso para cambiar el color del titulo porque navigationTitle
    // no expone directamente una forma de cambiar el color del titulo directamente.
    //    init () {
    //        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    //    }
    
    @State var gender: Int = 0
    @State var height: Double = 150
    @State var age: Int = 18
    @State var weight: Int = 50
    
    var body: some View {
        VStack {
            HStack {
                ToggleButton(text: "Mujer", imageName: "m.circle.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Hombre", imageName: "h.circle.fill", gender: 1, selectedGender: $gender)
            }
            HeightCalculatorView(selecteHeight: $height)
            HStack {
                CounterButtonView(text: "Edad", number: $age)
                CounterButtonView(text: "Peso", number: $weight)
            }
            IMCCalculatorButton(userWeight: Double(weight), userHeight: height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator").foregroundColor(.white)
            }
        }
    }
}

struct IMCCalculatorButton: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: IMCResultView(userWeight: userWeight, userHeight: userHeight)) {
                Text("Calcular IMC")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    
    @Binding var selectedGender: Int
    
    var body: some View {
        
        // let color = selectedGender == gender ? Color.backgroundComponentSelected : Color.backgroundComponent
        let color = if (selectedGender == gender) {
            Color.backgroundComponentSelected
        } else {
            Color.backgroundComponent
        }
        
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationTextView(text: text)
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(color)
        }
    }
}

struct InformationTextView: View {
    let text: String
    
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleTextView: View {
    let text: String
    
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculatorView: View {
    @Binding var selecteHeight: Double
    
    var body: some View {
        VStack {
            TitleTextView(text: "Altura")
            InformationTextView(text: "\(Int(selecteHeight)) cm")
            Slider(value: $selecteHeight, in: 100...220, step: 1).accentColor(.purple).padding(.horizontal, 16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct CounterButtonView: View {
    let text: String
    @Binding var number: Int
    
    var body: some View {
        VStack {
            TitleTextView(text: text)
            InformationTextView(text: String(number))
            HStack {
                Button(action: {
                    if (number > 0) {
                        number -= 1
                    }
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                Button(action: {
                    if (number < 100) {
                        number += 1
                    }

                }) {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

#Preview {
    IMCView()
}
