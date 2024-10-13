//
//  LoginView.swift
//  New_Kream
//
//  Created by 황필호 on 10/6/24.
//

import UIKit

import SnapKit

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //로고 섹션
    public let kreamImgLogo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "KreamLogo")
        
        return img
    }()
    
    //기본 로그인 섹션
    public let loginView: UIView = UIView()
    
    public let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    public let loginField: UITextField = {
        let field = UITextField()
        field.placeholder = "예) kream@kream.co.kr"
        field.font = UIFont.systemFont(ofSize: 12)
        
        field.layer.cornerRadius = 15
        field.layer.masksToBounds = true // 경계 넘어가는 부분 잘라내는 함수
        field.layer.borderColor = UIColor(named: "LoginFieldColor")?.cgColor //// ios 기기별 저수준 색상 지원 위해 cgColor로 변환
        field.layer.borderWidth = 1
        field.borderStyle = .roundedRect
        
        return field
    }()
    
    public let pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    public let pwdField: UITextField = {
        let field = UITextField()
        field.placeholder = "비밀번호를 입력해주세요"
        field.font = UIFont.systemFont(ofSize: 12)
    
        field.layer.cornerRadius = 15
        field.layer.masksToBounds = true
        field.layer.borderColor = UIColor(named: "LoginFieldColor")?.cgColor
        field.layer.borderWidth = 1
        field.borderStyle = .roundedRect
        field.isSecureTextEntry = true //비밀번호 가려주는 거
        
        return field
    }()
    
    //ios 15 부터 configuration을 통해 버튼 생성 (더 다양한 ui를 생성하기 위해)
    public let loginBtn: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled() //filled 속성 선택
        
        //attributedTitle 같은건 특정 글자에 속성을 추가하기 위해 사용
        config.attributedTitle = AttributedString(
            "로그인",
            attributes: AttributeContainer([
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 14, weight: .bold)
         ])
        )
        
        config.baseBackgroundColor = UIColor.systemBlue
        config.titleAlignment = .center
        config.background.cornerRadius = 8
        
        button.configuration = config
        
        return button
    }()
    
    //추가 로그인 버튼 섹션
    public let extraLoginBtnView: UIView = UIView()
    
    public let kakaoBtn: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        
        //이미지 넣기
        if let logoImage = UIImage(named: "KakaoLogo") {
            config.image = logoImage
            config.imagePlacement = .leading
            config.imagePadding = 69
            //위치 세밀하게 조정
            config.contentInsets = NSDirectionalEdgeInsets(
                //이미지 간격 조정(텍스트와 버튼)
                top: 13,
                leading: 17,
                bottom: 13,
                trailing: 69
            )
        }
        
        //텍스트 조정
        config.attributedTitle = AttributedString(
        "카카오로 로그인",
        attributes: AttributeContainer([
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 13, weight: .semibold)
         ])
        )
        
        //테두리 조정
        config.baseBackgroundColor = UIColor.white
        config.background.strokeColor = UIColor(named: "LoginFieldColor")
        config.background.strokeWidth = 1
        config.titleAlignment = .center
        config.background.cornerRadius = 10
        
        button.configuration = config
        
        return button
    }()
    
    public let appleBtn: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        
        //이미지 넣기
        if let logoImage = UIImage(named: "AppleLogo") {
            config.image = logoImage
            config.imagePlacement = .leading
            config.imagePadding = 69
            //위치 세밀하게 조정
            config.contentInsets = NSDirectionalEdgeInsets(
                //이미지 간격 조정(텍스트와 버튼)
                top: 13,
                leading: 17,
                bottom: 13,
                trailing: 69
            )
        }
        
        //텍스트 조정
        config.attributedTitle = AttributedString(
        "Apple로 로그인",
        attributes: AttributeContainer([
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 13, weight: .semibold)
         ])
        )
        
        //테두리 조정
        config.baseBackgroundColor = UIColor.white
        config.background.strokeColor = UIColor(named: "LoginFieldColor")
        config.background.strokeWidth = 1
        config.titleAlignment = .center
        config.background.cornerRadius = 10
        
        button.configuration = config
        
        return button
    }()
    
}

extension LoginView {
    //함수 묶음
    func setUpConstraints() {
        setUpKreamLogoView() //크림 로고 섹션
        setUploginView() //기본 로그인 섹션
        setUploginBtnView() //로그인 버튼 섹션
    }

    //크림 로고 섹션
    func setUpKreamLogoView() {
        self.addSubview(kreamImgLogo)
        
        kreamImgLogo.translatesAutoresizingMaskIntoConstraints = false
        
        kreamImgLogo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(126)
            $0.leading.equalToSuperview().inset(53)
            $0.trailing.equalToSuperview().inset(53)
            $0.width.equalTo(287)
            $0.height.equalTo(75)
        }
    }
    //기본 로그인 섹션
    func setUploginView() {
        self.addSubview(loginView)
        self.addSubview(loginLabel)
        self.addSubview(loginField)
        self.addSubview(pwdLabel)
        self.addSubview(pwdField)
        self.addSubview(loginBtn)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginField.translatesAutoresizingMaskIntoConstraints = false
        pwdLabel.translatesAutoresizingMaskIntoConstraints = false
        pwdField.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        loginView.snp.makeConstraints() {
            $0.top.equalTo(kreamImgLogo.snp.bottom).offset(87)
            $0.leading.equalToSuperview().inset(45)
            $0.trailing.equalToSuperview().inset(45)
            $0.width.equalTo(303)
            $0.height.equalTo(186)
        }
        
        loginLabel.snp.makeConstraints() {
            $0.top.equalTo(loginView.snp.top)
            $0.leading.equalTo(loginView.snp.leading)
            $0.trailing.equalTo(loginView.snp.trailing)
            $0.width.equalTo(loginView.snp.width)
            $0.height.equalTo(15)
        }
        
        loginField.snp.makeConstraints() {
            $0.top.equalTo(loginLabel.snp.bottom).offset(8)
            $0.leading.equalTo(loginView.snp.leading)
            $0.trailing.equalTo(loginView.snp.trailing)
            $0.width.equalTo(loginView.snp.width)
            $0.height.equalTo(34)
        }
        
        pwdLabel.snp.makeConstraints() {
            $0.top.equalTo(loginField.snp.bottom).offset(17)
            $0.leading.equalTo(loginView.snp.leading)
            $0.trailing.equalTo(loginView.snp.trailing)
            $0.width.equalTo(loginView.snp.width)
            $0.height.equalTo(15)
        }
        
        pwdField.snp.makeConstraints() {
            $0.top.equalTo(pwdLabel.snp.bottom).offset(8)
            $0.leading.equalTo(loginView.snp.leading)
            $0.trailing.equalTo(loginView.snp.trailing)
            $0.width.equalTo(loginView.snp.width)
            $0.height.equalTo(loginField.snp.height)
        }
        
        loginBtn.snp.makeConstraints() {
            $0.top.equalTo(pwdField.snp.bottom).offset(17)
            $0.leading.equalTo(loginView.snp.leading)
            $0.trailing.equalTo(loginView.snp.trailing)
            $0.width.equalTo(loginView.snp.width)
            $0.height.equalTo(38)
        }
    }
    
    //로그인 버튼 섹션
    func setUploginBtnView() {
        self.addSubview(extraLoginBtnView)
        self.addSubview(kakaoBtn)
        self.addSubview(appleBtn)
        
        extraLoginBtnView.translatesAutoresizingMaskIntoConstraints = false
        kakaoBtn.translatesAutoresizingMaskIntoConstraints = false
        appleBtn.translatesAutoresizingMaskIntoConstraints = false
        
        extraLoginBtnView.snp.makeConstraints() {
            $0.top.equalTo(loginBtn.snp.bottom).offset(87)
            $0.leading.equalToSuperview().inset(47.5)
            $0.trailing.equalToSuperview().inset(47.5)
            $0.width.equalTo(298)
            $0.height.equalTo(102)
        }
        
        kakaoBtn.snp.makeConstraints() {
            $0.top.equalTo(extraLoginBtnView.snp.top)
            $0.leading.equalTo(extraLoginBtnView.snp.leading)
            $0.trailing.equalTo(extraLoginBtnView.snp.trailing)
            $0.width.equalTo(extraLoginBtnView.snp.width)
            $0.height.equalTo(40)
        }
        
        appleBtn.snp.makeConstraints() {
            $0.top.equalTo(kakaoBtn.snp.bottom).offset(22)
            $0.leading.equalTo(extraLoginBtnView.snp.leading)
            $0.trailing.equalTo(extraLoginBtnView.snp.trailing)
            $0.width.equalTo(extraLoginBtnView.snp.width)
            $0.height.equalTo(kakaoBtn.snp.height)
        }
    }
}
