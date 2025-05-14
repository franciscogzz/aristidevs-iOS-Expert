//
//  IMCResultView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 12/05/25.
//

import SwiftUI

struct IMCResultView: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        VStack {
            Text("Tu resultado").font(.title).bold().foregroundColor(.white)
            let resultIMC = calculateIMC(weight: userWeight, height: userHeight)
            InformationView(result: resultIMC)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

func calculateIMC(weight: Double, height: Double) -> Double {
    return weight / pow(height / 100, 2)
}

struct InformationView:View {
    let result: Double
    
    var body: some View {
        let information = getIMCResult(result: result)
        
        VStack {
            Spacer()
            Text(information.0).foregroundColor(information.2).font(.title).bold()
            Spacer()
            Text("\(result, specifier: "%.2f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Spacer()
            Text(information.1).foregroundColor(.white).font(.title2).padding(.horizontal, 16)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16).padding(16)
    }
}

func getIMCResult(result: Double) -> (String, String, Color) {
    let title: String
    let description: String
    let color: Color
    
    switch result {
        case 0.00...19.99:
            title = "Bajo peso"
            description = "Estás por debajo del peso recomendado según el IMC."
            color = .yellow
        case 20.00...24.99:
            title = "Peso normal"
            description = "Estás en el peso recomendado según el IMC."
            color = .green
        case 25.00...29.99:
            title = "Sobrepeso"
            description = "Estás por encima del peso recomendado según el IMC."
            color = .orange
        case 30.00...100:
            title = "Obesidad"
            description = "Estás muy por encima del peso recomendado según el IMC."
            color = .red
        default:
            title = "ERROR"
            description = "Ha ocurrido un error"
            color = .gray
    }
    
    return (title, description, color)
}

#Preview {
    IMCResultView(userWeight: 75.5, userHeight: 174.5)
}
