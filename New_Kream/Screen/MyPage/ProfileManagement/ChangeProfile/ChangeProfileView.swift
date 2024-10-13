//
//  ChangeProfileView.swift
//  New_Kream
//
//  Created by 황필호 on 10/10/24.
//

import UIKit

class ChangeProfileView: UIView {

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
        img.image = UIImage(named: "ProfileImg")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        
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
        field.placeholder = "새로운 이메일을 입력해주세요!"
        field.font = UIFont.systemFont(ofSize: 14)
        
        field.layer.cornerRadius = 10
        field.layer.masksToBounds = true
        field.layer.borderColor = UIColor(named: "ProfileBtnColor")?.cgColor
        field.layer.borderWidth = 1
        field.borderStyle = .roundedRect
        
        return field
    }()
    
    public let emailChangeBtn: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        
        config.attributedTitle = AttributedString(
            "확인",
            attributes: AttributeContainer([
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 14, weight: .medium)
         ])
        )
        
        config.baseBackgroundColor = UIColor.white
        config.titleAlignment = .center
        config.background.strokeColor = .black
        config.background.strokeWidth = 1
        config.background.cornerRadius = 6
        
        button.configuration = config
        
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
        field.placeholder = "새로운 비밀번호를 입력해주세요!"
        field.font = UIFont.systemFont(ofSize: 14)
        
        field.layer.cornerRadius = 10
        field.layer.masksToBounds = true
        field.layer.borderColor = UIColor(named: "ProfileBtnColor")?.cgColor
        field.layer.borderWidth = 1
        field.borderStyle = .roundedRect
        
        return field
    }()
    
    public let pwdChangeBtn: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        
        config.attributedTitle = AttributedString(
            "확인",
            attributes: AttributeContainer([
                .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 14, weight: .medium)
         ])
        )
        
        config.baseBackgroundColor = UIColor.white
        config.titleAlignment = .center
        config.background.strokeColor = .black
        config.background.strokeWidth = 1
        config.background.cornerRadius = 6
        
        button.configuration = config
        
        return button
    }()
    
}

extension ChangeProfileView {
    
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
            $0.width.equalTo(211)
            $0.height.equalTo(26)
        }
        
        profileManagementLabel.snp.makeConstraints() {
            $0.top.equalTo(headerView.snp.top)
            $0.centerX.equalTo(headerView)
            $0.width.equalTo(74)
            $0.height.equalTo(26)
        }
    }
    
    func setUpProfileImgView() {
        self.addSubview(profileImg)
        
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        
        profileImg.snp.makeConstraints() {
            $0.top.equalTo(headerView.snp.bottom).offset(52)
            $0.leading.equalToSuperview().inset(151)
            $0.trailing.equalToSuperview().inset(152)
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
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
            $0.width.equalTo(349)
            $0.height.equalTo(191)
        }
        
        profileInfoLabel.snp.makeConstraints() {
            $0.top.equalTo(profileInfo.snp.top)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(profileInfo.snp.trailing)
            $0.width.equalTo(349)
            $0.height.equalTo(29)
        }
        
        userEmailLabel.snp.makeConstraints() {
            $0.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(profileInfo.snp.trailing).offset(285)
            $0.width.equalTo(64)
            $0.height.equalTo(22)
        }
        
        userEmailField.snp.makeConstraints() {
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(emailChangeBtn.snp.leading).offset(-9)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        emailChangeBtn.snp.makeConstraints() {
            $0.top.equalTo(userEmailField.snp.top)
            $0.trailing.equalTo(profileInfo.snp.trailing)
            $0.width.equalTo(58)
            $0.height.equalTo(userEmailField.snp.height)
        }
        
        userPwdLabel.snp.makeConstraints() {
            $0.top.equalTo(userEmailField.snp.bottom).offset(23)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(profileInfo.snp.trailing).offset(272)
            $0.width.equalTo(77)
            $0.height.equalTo(22)
        }
        
        userPwdField.snp.makeConstraints() {
            $0.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileInfo.snp.leading)
            $0.trailing.equalTo(pwdChangeBtn.snp.leading).offset(-9)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        pwdChangeBtn.snp.makeConstraints() {
            $0.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            $0.trailing.equalTo(profileInfo.snp.trailing)
            $0.width.equalTo(58)
            $0.height.equalTo(userPwdField.snp.height)
        }
    }
    
    
}
