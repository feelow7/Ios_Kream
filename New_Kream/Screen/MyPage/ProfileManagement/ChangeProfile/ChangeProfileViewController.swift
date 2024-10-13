//
//  ChangeProfileViewController.swift
//  New_Kream
//
//  Created by 황필호 on 10/10/24.
//

import UIKit

class ChangeProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = changeProfileView
        
        navigationItem.hidesBackButton = true //Back 버튼 숨기기
        backArrowButton()
    }
    
    private lazy var changeProfileView: ChangeProfileView = {
        let view = ChangeProfileView()
        
        return view
    }()
    
    func backArrowButton(){
        let backArrowButton = UIBarButtonItem(image: UIImage(named: "BackArrowImg"), style: .plain, target: self, action: #selector(backButtonTapped))
        backArrowButton.tintColor = .black
        navigationItem.leftBarButtonItem = backArrowButton
    }
    
    @objc
    func backButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
}
