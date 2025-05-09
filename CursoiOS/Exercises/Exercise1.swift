//
//  ContentView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 24/04/25.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
            Rectangle().foregroundColor(.orange).frame(height: 100)
            HStack {
                Circle().foregroundColor(.green)
                Rectangle().foregroundColor(.black)
                Circle().foregroundColor(.indigo)
            }.frame(height: 250)
            Rectangle().foregroundColor(.orange).frame(height: 100)
            HStack {
                Rectangle().foregroundColor(.blue)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
        }.background(.red)
    }
}

#Preview {
    Exercise1()
}
