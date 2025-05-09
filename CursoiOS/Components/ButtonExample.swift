//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 30/04/25.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Click me!", action: {
            print(">>> Button clicked <<<")
        })
        Button(
            action: {
                print(">>> Button clicked <<<")
            },
            label: {
                Text("Click me!")
                    .frame(width: 150, height: 50)
                    .foregroundStyle(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        )
    }
}

struct Counter: View {
    @State var subscriberNumbers = 0
    
    var body: some View {
        Button(
            action: {
                subscriberNumbers += 1
            },
            label: {
                Text("Subscribers: \(subscriberNumbers)")
                    .bold()
                    .font(.title)
                    .frame(height: 50)
                    .foregroundStyle(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        )
    }
}

#Preview {
    Counter()
}
