//
//  MyPageViewController.swift
//  New_Kream
//
//  Created by 황필호 on 10/6/24.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
        
    }
    
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        view.profileManagementBtn.addTarget(self, action: #selector(profileManagementBtnTapped), for: .touchUpInside)
        
        return view
    }()
    
    @objc
    private func profileManagementBtnTapped() {
        let profileManagementVC = ProfileManagementViewController()
        
        if let image = myPageView.profileImg.image {
            profileManagementVC.profileImage = image // 현재 프로필 이미지 전달
        }
        navigationController?.pushViewController(profileManagementVC, animated: true)
    }
    

}
