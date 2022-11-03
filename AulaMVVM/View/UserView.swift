//
//  ProfileView.swift
//  AulaMVVM
//
//  Created by Victor Letichevsky on 12/10/22.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Usuário atual")) {
                    currentUserInfo
                }
                Section(header: Text("Todos os usuários")) {
                    allUsersButton
                }
                logoutButton
            }
        }
    }
    
    var currentUserInfo: some View {
        VStack {
            HStack {
                Text("Nome: ")
                    .bold()
                Spacer()
                Text("\(userViewModel.name)")
            }
            Divider()
            HStack {
                Text("Altura: ")
                    .bold()
                Spacer()
                Text("\(userViewModel.height) cm")
            }
        }
    }
    var allUsersButton: some View {
        NavigationLink {
            AllUsersView(loginViewModel: userViewModel)
        } label: {
            Text("Todos os usuários")
            
        }
        
    }
    var logoutButton: some View {
        Button {
            userViewModel.logout()
        } label: {
            HStack {
                Spacer()
                Text("Sair")
            }
        }.buttonStyle(.borderless)
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
