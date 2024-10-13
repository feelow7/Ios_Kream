//
//  LoginViewController.swift
//  New_Kream
//
//  Created by 황필호 on 10/6/24.
//

import UIKit

class LoginViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginview
        
        //UserDefaults에서 로그인 정보 불러오기
        if let savedLogin = LoginModel.loadLoginUserDefaults() {
            loginview.loginField.text = savedLogin.id
            loginview.pwdField.text = savedLogin.pwd
        } else {
            setDefaultLogin()
        }
    }
    
    private lazy var loginview: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        
        return view
    }()
    
    @objc func loginBtnTapped() {
        // guard and 조건으로 loginId와 loginPwd 받아옴
        guard let loginId = loginview.loginField.text, !loginId.isEmpty,
              let loginPwd = loginview.pwdField.text, !loginPwd.isEmpty else {
            showAlert(
                title: "Error",
                message: "아이디와 비밀번호를 입력해주세요!"
            )
            return
        }
        // UserDefaults에서 저장된 정보와 비교
            if let savedLogin = LoginModel.loadLoginUserDefaults(),
               savedLogin.id == loginId && savedLogin.pwd == loginPwd {
                //로그인 성공 시 UserDefaults에 저장
                let loginModel = LoginModel(id: loginId, pwd: loginPwd)
                loginModel.loginUserDefaults()

                let tabBarMainViewController = TabBarMainViewController()
                tabBarMainViewController.modalPresentationStyle = .fullScreen
                present(tabBarMainViewController, animated: true)
            } else {
                showAlert(title: "Error", message: "아이디와 비밀번호가 일치하지 않습니다!")
            }
    }
    
    private func showAlert(title: String, message: String) {
        let alter = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alter.addAction(UIAlertAction(title: "OK", style: .default))
        present(alter, animated: true)
    }
    
    // 앱이 처음 실행될 때 기본 로그인 정보 설정
        private func setDefaultLogin() {
            let defaults = UserDefaults.standard
            defaults.set("1234", forKey: "userEmail")
            defaults.set("1234", forKey: "userPassword")
            print("기본값으로 로그인 정보가 설정되었습니다.")
            
            // 기본값을 설정한 후 로그인 필드에 자동으로 표시
            loginview.loginField.text = "1234"
            loginview.pwdField.text = "1234"
        }
}
