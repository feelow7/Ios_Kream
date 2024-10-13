//
//  MyPageView.swift
//  New_Kream
//
//  Created by 황필호 on 10/6/24.
//

import UIKit

import SnapKit

class MyPageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "MyPageBackgroundColor")
        
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let topSectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    public let headerView: UIView = UIView()
    
    public let settingBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "SettingImg")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        
        return button
    }()

    public let cameraBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "CameraImg")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    public let profileView: UIView = UIView()
    
    public let profileImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ProfileImg")
        
        return img
    }()
    
    public let profileName: UILabel = {
        let label = UILabel()
        label.text = "Hwang_iOS"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        
        return label
    }()
    
    public let follower: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    public let following: UILabel = {
        let label = UILabel()
        label.text = "팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    public let profileBtnView: UIView = UIView()
    
    public let profileManagementBtn: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        
        config.attributedTitle = AttributedString(
        "프로필 관리",
        attributes: AttributeContainer([
            .foregroundColor:UIColor.black,
                .font: UIFont.systemFont(ofSize: 9, weight: .regular )
         ])
        )
        
        config.baseBackgroundColor = UIColor.white
        config.background.strokeColor = UIColor(named: "ProfileBtnColor")
        config.background.strokeWidth = 0.8
        config.titleAlignment = .center
        config.background.cornerRadius = 8
        
        button.configuration = config
        
        return button
    }()
    
    public let profileShareBtn: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        
        config.attributedTitle = AttributedString(
        "프로필 공유",
        attributes: AttributeContainer([
            .foregroundColor:UIColor.black,
                .font: UIFont.systemFont(ofSize: 9, weight: .regular )
         ])
        )
        
        config.baseBackgroundColor = UIColor.white
        config.background.strokeColor = UIColor(named: "ProfileBtnColor")
        config.background.strokeWidth = 0.8
        config.titleAlignment = .center
        config.background.cornerRadius = 8
        
        button.configuration = config
        
        return button
    }()
    
    public let bottomSectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
}

extension MyPageView {
    //@@메인 상단 하단 분리
    func setUpConstraints() {
        setUpTopSectionView()
        setUpBottomView()
    }
    
    //@@상단 뷰 컨테이너 탑 섹션
    func setUpTopSectionView() {
        self.addSubview(topSectionView)
        self.addSubview(headerView)
        
        //탑 섹션 안에 들어있는 섹션들
        setHeaderViewContainer()
        setProfileViewContainer()
        setProfileBtnContainer()
        
        topSectionView.translatesAutoresizingMaskIntoConstraints = false
        
        topSectionView.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(297)
        }
    }
    
    //탑 섹션 안에 있는 카메라와 세팅 버튼 섹션
    func setHeaderViewContainer() {
        self.addSubview(headerView)
        self.addSubview(settingBtn)
        self.addSubview(cameraBtn)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        settingBtn.translatesAutoresizingMaskIntoConstraints = false
        cameraBtn.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.snp.makeConstraints() {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(25)
        }
        
        settingBtn.snp.makeConstraints() {
            $0.top.equalTo(headerView.snp.top)
            $0.leading.equalToSuperview().offset(32.5)
            $0.width.height.equalTo(25)
        }
        
        cameraBtn.snp.makeConstraints() {
            $0.top.equalTo(headerView.snp.top)
            $0.trailing.equalToSuperview().offset(-32.5)
            $0.width.height.equalTo(25)
        }
    }
    
    //탑 섹션 안에있는 프로필 섹션 모음
    func setProfileViewContainer() {
        self.addSubview(profileView)
        self.addSubview(profileImg)
        self.addSubview(profileName)
        self.addSubview(follower)
        self.addSubview(following)
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        profileName.translatesAutoresizingMaskIntoConstraints = false
        follower.translatesAutoresizingMaskIntoConstraints = false
        following.translatesAutoresizingMaskIntoConstraints = false
        
        //프로필 컨테이너
        profileView.snp.makeConstraints() {
            $0.top.equalTo(headerView.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(32.5)
            $0.trailing.equalToSuperview().offset(-139.5)
            $0.height.equalTo(90)
            $0.width.equalTo(221)
        }
        
        profileImg.snp.makeConstraints() {
            $0.top.equalTo(profileView.snp.top)
            $0.leading.equalTo(profileView.snp.leading)
            $0.width.height.equalTo(90)
        }
        
        profileName.snp.makeConstraints() {
            $0.top.equalTo(profileView.snp.top).offset(21)
            $0.trailing.equalTo(profileView.snp.trailing)
            $0.leading.equalTo(profileImg.snp.trailing).offset(16)
            $0.width.equalTo(115)
            $0.height.equalTo(23)
        }
        
        follower.snp.makeConstraints() {
            $0.top.equalTo(profileName.snp.bottom).offset(6)
            $0.leading.equalTo(profileName.snp.leading)
            $0.width.equalTo(57)
            $0.height.equalTo(19)
        }
        
        following.snp.makeConstraints() {
            $0.top.equalTo(profileName.snp.bottom).offset(6)
            $0.leading.equalTo(follower.snp.trailing).offset(8)
            $0.width.equalTo(57)
            $0.height.equalTo(19)
        }
    }
    
    func setProfileBtnContainer() {
        self.addSubview(profileBtnView)
        self.addSubview(profileManagementBtn)
        self.addSubview(profileShareBtn)
        
        profileBtnView.translatesAutoresizingMaskIntoConstraints = false
        profileManagementBtn.translatesAutoresizingMaskIntoConstraints = false
        profileShareBtn.translatesAutoresizingMaskIntoConstraints = false
        
        profileBtnView.snp.makeConstraints() {
            $0.top.equalTo(profileView.snp.bottom).offset(26)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(26)
        }
        
        profileManagementBtn.snp.makeConstraints() {
            $0.top.equalTo(profileBtnView.snp.top)
            $0.leading.equalTo(profileBtnView.snp.leading).offset(32.5)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
        
        profileShareBtn.snp.makeConstraints() {
            $0.top.equalTo(profileBtnView.snp.top)
            $0.trailing.equalTo(profileBtnView.snp.trailing).offset(-32.5)
            $0.leading.equalTo(profileManagementBtn.snp.trailing).offset(14)
            $0.width.equalTo(157)
            $0.height.equalTo(26)
        }
    }
    
    //@@하단 뷰 컨테이너 바텀 뷰
    func setUpBottomView() {
        self.addSubview(bottomSectionView)
        
        bottomSectionView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomSectionView.snp.makeConstraints() {
            $0.top.equalTo(topSectionView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(531)
        }
    }
    
}
