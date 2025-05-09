//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 29/04/25.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftui")
            .resizable()
            .frame(width: 200, height: 200)
        Image(systemName: "figure.walk")
            .resizable()
            .frame(width: 50, height: 50)
    }
}

#Preview {
    ImageExample()
}
