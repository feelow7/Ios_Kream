//
//  SavedView.swift
//  New_Kream
//
//  Created by 황필호 on 10/6/24.
//

import UIKit

import SnapKit

class SavedView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
            
        self.setUpConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let savedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        
        return table
    }()
    
    func setUpConstraints() {
        [savedTitleLabel, tableView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        savedTitleLabel.snp.makeConstraints() {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-302)
        }
        
        tableView.snp.makeConstraints() {
            $0.top.equalTo(savedTitleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
