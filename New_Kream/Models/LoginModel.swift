//
//  LoginModel.swift
//  New_Kream
//
//  Created by 황필호 on 10/6/24.
//

import Foundation

struct LoginModel {
    var id: String
    var pwd: String
    
    // UserDefaults에 저장
        func loginUserDefaults() {
            let defaults = UserDefaults.standard
            defaults.set(id, forKey: "userEmail") // 이메일 저장
            defaults.set(pwd, forKey: "userPassword") // 비밀번호 저장
        }
        
        // UserDefaults에서 불러오기
        static func loadLoginUserDefaults() -> LoginModel? {
            let defaults = UserDefaults.standard
            guard let email = defaults.string(forKey: "userEmail"),
                  let password = defaults.string(forKey: "userPassword") else {
                return nil
            }
            return LoginModel(id: email, pwd: password)
        }
}
