//
//  ProfileManagementView.swift
//  New_Kream
//
//  Created by 황필호 on 10/7/24.
//

import UIKit
import SnapKit

class ProfileManagementView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public let headerView: UIView = UIView()
    public let profileManagementLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 관리"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    public let profileImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "ProfileImg")?.withRenderingMode(.alwaysOriginal)
        
        return img
    }()
    
    public let profileInfo: UIView = UIView()
    
    public let profileInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    public let userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left

        return label
    }()
    public let userEmailField: UITextField = {
        let field = UITextField()
        field.text = "example@naver.com"
        field.font = UIFont.systemFont(ofSize: 14)
        field.layer.cornerRadius = 10
        field.layer.masksToBounds = true
        field.layer.borderColor = UIColor(named: "ProfileBtnColor")?.cgColor
        field.layer.borderWidth = 1
        field.borderStyle = .roundedRect
        field.isUserInteractionEnabled = false // 초기 비활성화
        return field
    }()
    
    public let emailChangeBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal) // 초기 제목 설정
        button.setTitleColor(.black, for: .normal) // 제목 색상 설정
        button.tag = 0 // 초기 상태 설정
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        return button
    }()
    
    public let userPwdLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public let userPwdField: UITextField = {
        let field = UITextField()
        field.font = UIFont.systemFont(ofSize: 14)
        field.layer.cornerRadius = 10
        field.layer.masksToBounds = true
        field.layer.borderColor = UIColor(named: "ProfileBtnColor")?.cgColor
        field.layer.borderWidth = 1
        field.borderStyle = .roundedRect
        field.isUserInteractionEnabled = false // 초기 비활성화
        return field
    }()
    
    public let pwdChangeBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal) // 초기 제목 설정
        button.setTitleColor(.black, for: .normal) // 제목 색상 설정
        button.tag = 0 // 초기 상태 설정
        button.layer.cornerRadius = 6
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = .white
        return button
    }()
    
}

extension ProfileManagementView {
    
    func setUpConstraints() {
        setUpHeaderView()
        setUpProfileImgView()
        setUpProfileInfoView()
    }
    
    func setUpHeaderView() {
        self.addSubview(headerView)
        self.addSubview(profileManagementLabel)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        profileManagementLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(66)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(26) // 높이 설정
        }
        
        profileManagementLabel.snp.makeConstraints() {
            $0.top.equalTo(headerView.snp.top)
            $0.centerX.equalTo(headerView)
            $0.width.equalTo(74)
            $0.height.equalTo(26) // 높이 설정
        }
    }
    
    func setUpProfileImgView() {
        self.addSubview(profileImg)
        
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        
        profileImg.snp.makeConstraints() {
            $0.top.equalTo(headerView.snp.bottom).offset(52)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(90)
        }
        self.layoutIfNeeded()
        print("Profile Image Frame: \(profileImg.frame)")
    }
    
    func setUpProfileInfoView() {
        self.addSubview(profileInfo)
        self.addSubview(profileInfoLabel)
        self.addSubview(userEmailLabel)
        self.addSubview(userEmailField)
        self.addSubview(emailChangeBtn)
        self.addSubview(userPwdLabel)
        self.addSubview(userPwdField)
        self.addSubview(pwdChangeBtn)
        
        profileInfo.translatesAutoresizingMaskIntoConstraints = false
        profileInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        userEmailField.translatesAutoresizingMaskIntoConstraints = false
        emailChangeBtn.translatesAutoresizingMaskIntoConstraints = false
        userPwdLabel.translatesAutoresizingMaskIntoConstraints = false
        userPwdField.translatesAutoresizingMaskIntoConstraints = false
        pwdChangeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        profileInfo.snp.makeConstraints() {
            $0.top.equalTo(profileImg.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(27)
            $0.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(191) // 높이 설정
        }
        
        profileInfoLabel.snp.makeConstraints() {
            $0.top.equalTo(profileInfo.snp.top)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(profileInfo.snp.trailing)
            $0.height.equalTo(29) // 높이 설정
        }
        
        userEmailLabel.snp.makeConstraints() {
            $0.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(emailChangeBtn.snp.leading).offset(-9)
            $0.height.equalTo(22) // 높이 설정
        }
        
        userEmailField.snp.makeConstraints() {
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(emailChangeBtn.snp.leading).offset(-9)
            $0.height.equalTo(32) // 높이 설정
        }
        
        emailChangeBtn.snp.makeConstraints() {
            $0.top.equalTo(userEmailField.snp.top)
            $0.trailing.equalTo(profileInfo.snp.trailing)
            $0.width.equalTo(58) // 너비 설정
            $0.height.equalTo(userEmailField.snp.height) // 높이 일치
        }
        
        userPwdLabel.snp.makeConstraints() {
            $0.top.equalTo(userEmailField.snp.bottom).offset(23)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(pwdChangeBtn.snp.leading).offset(-9)
            $0.height.equalTo(22) // 높이 설정
        }
        
        userPwdField.snp.makeConstraints() {
            $0.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(pwdChangeBtn.snp.leading).offset(-9)
            $0.height.equalTo(32) // 높이 설정
        }
        
        pwdChangeBtn.snp.makeConstraints() {
            $0.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            $0.trailing.equalTo(profileInfo.snp.trailing)
            $0.width.equalTo(58) // 너비 설정
            $0.height.equalTo(userPwdField.snp.height) // 높이 일치
        }
    }
}

