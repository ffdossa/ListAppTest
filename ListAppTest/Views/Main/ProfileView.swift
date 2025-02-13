//
//  ProfileView.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewModel = ProfileViewModel()

  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        if let user = viewModel.user {
          profile(user: user)
        } else {
          Text("Loading profile...")
            .font(.title3)
            .bold()
        }
      }
      .navigationTitle("Profile")
    }
    .onAppear {
      viewModel.fetchUser()
    }
  }


  @ViewBuilder
  func profile(user: UserModel) -> some View {
    VStack {
      ZStack(alignment: .leading) {
        RoundedRectangle(cornerRadius: 15)
          .frame(height: 110)
          .foregroundStyle(.indigo)
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: "person.circle.fill")
              .resizable()
              .frame(width: 60, height: 60)
              .aspectRatio(contentMode: .fit)
              .foregroundStyle(.white)

            VStack(alignment: .leading) {
              Text(user.username)
                .font(.title3)
                .bold()

              Text(user.email)
                .font(.subheadline)
                .foregroundStyle(.secondary)

              Divider()
            }
            .padding(.leading)
          }

          HStack {
            Image(systemName: "calendar.badge.plus")

            Text("\(Date(timeIntervalSince1970: user.timeJoined).formatted(date: .abbreviated, time: .shortened))")
              .font(.subheadline)
          }
        }
        .padding()
      }

      Spacer()

      PressButton(title: "Sign Out",
                  background: .indigo) {
        viewModel.logOut()
      }
    }
    .padding()
  }
}

#Preview {
  ProfileView()
}
