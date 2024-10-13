//
//  ProfileManagementViewController.swift
//  New_Kream
//
//  Created by 황필호 on 10/7/24.
//

import UIKit

class ProfileManagementViewController: UIViewController {
    var profileImage: UIImage?//프로필 사진 받을 프로퍼티

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManagementView
        
        //UserDefaults에서 이메일과 비밀번호 불러오기
        if let savedLogin = LoginModel.loadLoginUserDefaults() {
            profileManagementView.userEmailField.text = savedLogin.id
            profileManagementView.userPwdField.text = savedLogin.pwd
        }
        //텍스트 필드 비활성화
        profileManagementView.userEmailField.isUserInteractionEnabled = false
        profileManagementView.userPwdField.isUserInteractionEnabled = false
        
        //변경 버튼에 액션 추가
        profileManagementView.emailChangeBtn.addTarget(self, action: #selector(emailChangeBtnTapped), for: .touchUpInside)
        profileManagementView.pwdChangeBtn.addTarget(self, action: #selector(pwdChangeBtnTapped), for: .touchUpInside)

        
        profileManagementView.profileImg.image = profileImage //프로필 이미지 설정

        navigationItem.hidesBackButton = true //Back 버튼 숨기기
        backArrowButton() // 뒤로가기 버튼 만들기
    }
    
    private lazy var profileManagementView: ProfileManagementView = {
        let view = ProfileManagementView()
        return view
        }()
    
    // 뒤로가기 버튼
    func backArrowButton() {
        let backArrowButton = UIBarButtonItem(image: UIImage(named: "BackArrowImg"), style: .plain, target: self, action: #selector(backButtonTapped))
        backArrowButton.tintColor = .black
        navigationItem.leftBarButtonItem = backArrowButton
    }
    
  @objc // 뒤로가기 함수
    func backButtonTapped() {
        // 네비게이션 스택에서 이전 화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }

    @objc func emailChangeBtnTapped() {
        print("Email Change Button Tag: \(profileManagementView.emailChangeBtn.tag)")
        
        if profileManagementView.emailChangeBtn.tag == 0 {
            // 버튼 클릭 시 텍스트 필드 활성화
            profileManagementView.userEmailField.isUserInteractionEnabled = true
            profileManagementView.userPwdField.isUserInteractionEnabled = true
            
            profileManagementView.emailChangeBtn.setTitle("확인", for: .normal) // 제목 변경
            profileManagementView.emailChangeBtn.tag = 1 // 상태 변경
        } else {
            // 확인 버튼 클릭 시 저장 로직
            if let newEmail = profileManagementView.userEmailField.text, !newEmail.isEmpty,
               let newPassword = profileManagementView.userPwdField.text, !newPassword.isEmpty {
                let updatedLogin = LoginModel(id: newEmail, pwd: newPassword)
                updatedLogin.loginUserDefaults() // 이메일 및 비밀번호 저장
            }
            
            // 비활성화
            profileManagementView.userEmailField.isUserInteractionEnabled = false
            profileManagementView.userPwdField.isUserInteractionEnabled = false

            profileManagementView.emailChangeBtn.setTitle("변경", for: .normal) // 제목 원래대로
            profileManagementView.emailChangeBtn.tag = 0 // 상태 초기화
        }

        print("Updated Email Change Button Title: \(profileManagementView.emailChangeBtn.title(for: .normal) ?? "nil")")
    }

    @objc func pwdChangeBtnTapped() {
        print("Password Change Button Tag: \(profileManagementView.pwdChangeBtn.tag)")
        
        if profileManagementView.pwdChangeBtn.tag == 0 {
            // 변경 버튼 클릭 시 텍스트 필드 활성화
            profileManagementView.userPwdField.isUserInteractionEnabled = true // 비밀번호 필드 활성화
            
            profileManagementView.pwdChangeBtn.setTitle("확인", for: .normal) // 제목 변경
            profileManagementView.pwdChangeBtn.tag = 1 // 상태 변경
        } else {
            // 확인 버튼 클릭 시 저장 로직
            if let newPassword = profileManagementView.userPwdField.text, !newPassword.isEmpty {
                let updatedLogin = LoginModel(id: profileManagementView.userEmailField.text ?? "", pwd: newPassword)
                updatedLogin.loginUserDefaults() // 비밀번호 저장
            }

            profileManagementView.userPwdField.isUserInteractionEnabled = false // 비밀번호 필드 비활성화
            
            profileManagementView.pwdChangeBtn.setTitle("변경", for: .normal) // 제목 원래대로
            profileManagementView.pwdChangeBtn.tag = 0 // 상태 초기화
        }

        print("Updated Password Change Button Title: \(profileManagementView.pwdChangeBtn.title(for: .normal) ?? "nil")")
    }

}
