//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 02/05/25.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            TextField("Ingresa tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal, 24)
                .onChange(of: email) { oldValue, newValue in
                    print("El antiguo valor era \(oldValue) y ahora es \(newValue)")
                }
            SecureField("Ingresa tu contraseña", text: $password)
                .keyboardType(.default)
                .padding(16)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal, 24)
                .onChange(of: password) { oldValue, newValue in
                    print("El antiguo valor era \(oldValue) y ahora es \(newValue)")
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
