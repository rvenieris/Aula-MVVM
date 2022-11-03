//
//  UserDAO.swift
//  AulaMVVM
//
//  Created by Ricardo Venieris on 02/11/22.
//

import Foundation

enum ReqError:Error {
    case userNotFound
}

class UserDAO {
    static let instance:UserDAO = UserDAO()
    private init(){}
    
    let allUsers:[User] = [
        User(name: "Victori", password: "12345", height: 175),
        User(name: "Ricardo", password: "54321", height: 190),
        User(name: "Pedroso", password: "43567", height: 184)]

    
    func auth(login name:String, password:String,
                  then completion: @escaping (Result<User, ReqError>)->Void) {
            // Query user for login & password
        if let findedUser = (allUsers.filter { $0.name     == name &&
                                               $0.password == password }
                                     .first) {
            completion(.success(findedUser))
        } else {
            completion(.failure(.userNotFound))
        }
        
    }

}
