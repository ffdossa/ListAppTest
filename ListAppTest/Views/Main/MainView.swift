//
//  ContentView.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel = MainViewModel()

  var body: some View {
    if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
      VStack {
        TabView() {
          ListView(userId: viewModel.currentUserId)
            .tabItem {
              Image(systemName: "list.bullet.circle.fill")
                .imageScale(.large)
            }

          ProfileView()
            .tabItem {
              Image(systemName: "person.circle.fill")
                .imageScale(.large)
            }
        }
        .tint(.indigo)
      }
    } else {
      LoginView()
    }
  }
}

#Preview {
  MainView()
}
