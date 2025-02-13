//
//  LoginView.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import SwiftUI

struct LoginView: View {
  @StateObject var viewModel = LoginViewModel()
  @State private var text: String = ""
  @FocusState private var isTextFieldFocused: Bool
  @State private var keyboardHeight: CGFloat = 0

  var body: some View {
    NavigationView {
      VStack {
        /// HEADER
        HeaderLoginView(title: "Welcome",
                        subtittle: "Please enter your email & password to log in.",
                        color: .indigo)
        //                                background: .indigo)

        VStack {
          if !viewModel.errorMessage.isEmpty {
            Text(viewModel.errorMessage)
              .foregroundStyle(.red)
          }

          TextField("Email", text: $viewModel.email)
            .textFieldStyle(.automatic)

          Divider()

          SecureField("Password", text: $viewModel.password)
            .textFieldStyle(.automatic)

          Divider()

          ZStack {
            PressButton(title: "Log In",
                        background: .indigo
            ) {
              viewModel.login()
            }
          }
        }
        .padding()

        Spacer()

        /// CREATE ACCOUNT
        VStack {
          Text("New around here?")
          NavigationLink("Create account", destination: RegisterView())
            .foregroundStyle(.indigo)
        }
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
}

#Preview {
  LoginView()
}
