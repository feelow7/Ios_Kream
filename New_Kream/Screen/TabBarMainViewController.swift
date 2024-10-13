//
//  TapBarMainViewController.swift
//  New_Kream
//
//  Created by 황필호 on 10/6/24.
//

import UIKit

class TabBarMainViewController: UITabBarController {
    private let homeViewController = HomeViewController()
    private let styleViewController = StyleViewController()
    private let shopViewController = ShopViewController()
    private let savedViewController = SavedViewController()
    //모달 전환은 네비게이션 스택을 포함하지 않음 그래서 UINavigationController로 감싸줘야 함.
    private let myPageViewController = UINavigationController(rootViewController: MyPageViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true //Back버튼 숨기기
        
        tabBarSetup()
        customizeTabBarAppearance()
        
        self.viewControllers = [homeViewController, styleViewController, shopViewController, savedViewController, myPageViewController]
    }
    
    //탭바 클릭시 밑에 글자 변경 함수
    func customizeTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground() // 기본 배경 설정
        
        // 선택된 아이템의 텍스트와 이미지 색상 설정
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
        
        // 선택되지 않은 아이템의 텍스트와 이미지 색상 설정
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        
        // 탭바에 appearance 적용
        tabBar.standardAppearance = appearance
        
        // iOS 15 이상에서는 scrollEdgeAppearance도 설정해야 함
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
}

extension TabBarMainViewController {
    func tabBarSetup() {
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "HomeImg")?.withRenderingMode(.alwaysOriginal), tag: 0)
        styleViewController.tabBarItem = UITabBarItem(title: "Style", image: UIImage(named: "StyleImg")?.withRenderingMode(.alwaysOriginal), tag: 1)
        shopViewController.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(named: "ShopImg")?.withRenderingMode(.alwaysOriginal), tag: 2)
        savedViewController.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(named: "SavedImg")?.withRenderingMode(.alwaysOriginal), tag: 3)
        myPageViewController.tabBarItem = UITabBarItem(title: "My", image: UIImage(named: "MyImg")?.withRenderingMode(.alwaysOriginal), tag: 4)
    }

}
