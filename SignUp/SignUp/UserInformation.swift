//
//  UserInformation.swift
//  SignUp
//
//  Created by 오동규 on 2022/08/02.
//

import Foundation

class UserInformation {
    static var shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var phoneNumber: String?
    var birth: String?
    
    
}
