//
//  RegisterView.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    @State private var text: String = ""
    @FocusState private var isTextFieldFocused: Bool
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            // HEADER
            HeaderLoginView(title: "Hello there.",
                            subtittle: "Please enter your email & password to create an account.",
                            color: .indigo)

            // CREATE ACCOUNT FORM
            VStack {
                TextField("Name", text: $viewModel.username)

                Divider()
                
                TextField("Email", text: $viewModel.email)
                    
                Divider()
                
                SecureField("Password", text: $viewModel.password)
                    
                Divider()
                
                ZStack {
                    PressButton(title: "Create Account",
                                background: .indigo
                    ) {
                        viewModel.register()
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .padding(.bottom, keyboardHeight)
        .animation(.easeOut(duration: 0.3), value: keyboardHeight)
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                if notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] is CGRect {
                    keyboardHeight = 20
                }
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardHeight = 0
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
}

#Preview {
    RegisterView()
}
