//
//  UserViewModel.swift
//  AulaMVVM
//
//  Created by Ricardo Venieris on 02/11/22.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var height: Int = 0
    @Published var isLogged: Bool = false
    @Published var loginFail: Bool = false

    var allUsers = [User]()
    private var selectedUser:User?
    private var filledLoginAndPassword:Bool {!self.name.isEmpty && !self.password.isEmpty}
    
    private func updateVM(from user: User?) {
        guard let user else {
            emptyUser()
            return
        }
        self.name = user.name
        self.password = user.password
        self.height = user.height
        isLogged = filledLoginAndPassword
        loginFail = false
    }
    
    func loadUsers() {
        allUsers = UserDAO.instance.allUsers
    }
    
    func authUser () {
            // Query user for login & password
        guard filledLoginAndPassword else { return }
        UserDAO.instance.auth(login: self.name, password: self.password, then: {result in
            switch result {
                case .success(let findedUser):
                    self.updateVM(from: findedUser)
                case .failure(_):
                    self.loginFail = true
            }
        })
    }
    
    func emptyUser () {
        self.name = ""
        self.password = ""
        self.height = 0
        
        self.isLogged = false
        self.loginFail = false
    }
    
    func logout(){
        self.password = ""
        self.isLogged = false
        self.loginFail = false
    }
}
