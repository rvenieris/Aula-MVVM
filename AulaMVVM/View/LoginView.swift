//
//  LoginView.swift
//  AulaMVVM
//
//  Created by Victor Letichevsky on 12/10/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        ZStack {
            Color.secondary
                .ignoresSafeArea()
            VStack {
                Spacer()
                appleLogo
                Spacer()
                nameTextField
                passwordSecureField
                logginButton
                loginFailMessage
                Spacer()
            }
            .onAppear {
                userViewModel.loadUsers()
            }
        }
    }
    
    var nameTextField: some View {
        TextField("Nome", text: $userViewModel.name)
            .padding()
            .background(Color("fieldBackGround"))
            .cornerRadius(10)
            .padding(10)
    }
    
    var passwordSecureField: some View {
        SecureField("Senha", text: $userViewModel.password)
            .padding()
            .background(Color("fieldBackGround"))
            .cornerRadius(10)
            .padding(10)
    }
    
    var logginButton: some View {
        Button {
            userViewModel.authUser()
        } label: {
            Text("Autenticar")
        }
        .buttonStyle(.borderedProminent)
        .fullScreenCover(isPresented: $userViewModel.isLogged) {
            UserView(userViewModel: userViewModel)
        }
    }
    
    var loginFailMessage: some View {
        Group {
            if userViewModel.loginFail {
                Text("O nome e/ou a senha estão incorretos")
                    .foregroundColor(Color.red)
                    .font(.callout)
                    .padding()
            } else {
                EmptyView()
            }
        }
    }
    
    var appleLogo: some View {
        Image(systemName: "applelogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .padding(.horizontal, 120)
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
