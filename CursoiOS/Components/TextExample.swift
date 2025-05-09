//
//  TextExample.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 29/04/25.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Custom").font(.system(
                size: 40,
                weight: .light,
                design: .monospaced
            ))
            .underline()
            .foregroundColor(.blue)
            .background(.red)
            Text("Javier Javier Javier Javier Javier Javier Javier Javier Javier")
                .frame(width: 200)
                .lineLimit(2)
                .lineSpacing(10)
        }
    }
}

#Preview {
    TextExample()
}
