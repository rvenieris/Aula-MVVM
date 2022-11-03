//
//  AllUsersView.swift
//  AulaMVVM
//
//  Created by Victor Letichevsky on 12/10/22.
//

import SwiftUI

struct AllUsersView: View {
    @ObservedObject var loginViewModel: UserViewModel
    var body: some View {
        // Vamos discutir sobre
        List(loginViewModel.allUsers) { user in
            VStack {
                HStack {
                    Text("Nome: ")
                        .bold()
                    +
                    Text(user.name)
                    Spacer()
                }
                HStack {
                    Text("Altura: ")
                        .bold()
                    +
                    Text("\(user.height) cm")
                    Spacer()
                }
            }.padding()
        }.navigationTitle("Usuários")
    }
}
//
//struct AllUsersView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllUsersView()
//    }
//}
