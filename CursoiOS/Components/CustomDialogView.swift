//
//  CustomDialogView.swift
//  CursoiOS
//
//  Created by Francisco Gonzalez on 23/05/25.
//

import SwiftUI

struct CustomDialogView<Content: View>: View {
    let closeDialog: () -> Void
    let onDismissOutside: Bool
    let content: Content

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray.opacity(0.8))
                .ignoresSafeArea()
                .onTapGesture {
                    if onDismissOutside {
                        closeDialog()
                    }
                }
            content.frame(
                width: UIScreen.main.bounds.size.width - 100,
                height: 300
            )
            .padding()
            .background(.white)
            .cornerRadius(16)
            .overlay(alignment: .topTrailing) {
                Button(
                    action: {
                        withAnimation {
                            closeDialog()
                        }
                    },
                    label: {
                        Image(systemName: "xmark.circle")
                    }
                ).foregroundColor(.gray).padding(16)
            }
        }
        .ignoresSafeArea()
        .frame(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height
        )
    }
}
