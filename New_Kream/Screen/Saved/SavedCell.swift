//
//  SavedTableViewCell.swift
//  New_Kream
//
//  Created by 황필호 on 10/11/24.
//

import UIKit

import SnapKit

class SavedCell: UITableViewCell {
    
    static let identifier: String = "SavedCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 코드로 셀을 초기화할때 호출되는 메서드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        setStackConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        //주사위 이미지 값은 ViewController에서 작성
        //imageView.image = UIImage(named: 여기에 더미데이터값)
        
        return imageView
    }()
    
    private lazy var productTittleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 1
        //주사위 이름 값은 ViewControler에서 작성
        //name.text = "여기에 더미 데이터 값이 들어감
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 9, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var savedBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SavedBtn"), for: .normal)
        
        return button
    }()
    
    private func setConstraints() {
        [productImageView, productTittleStackView, priceLabel, savedBtn].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        productImageView.snp.makeConstraints() {
            $0.top.leading.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.equalTo(72)
            $0.height.equalTo(72).priority(750) //우선순위를 약하게 설정하여 이미지 비율 유지
        }
        
        productTittleStackView.snp.makeConstraints() {
            $0.top.equalTo(productImageView.snp.top)
            $0.leading.equalTo(productImageView.snp.trailing).offset(13)
            $0.trailing.equalTo(savedBtn.snp.leading).offset(-10)
        }
        
        savedBtn.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-17)
            $0.width.height.equalTo(24)
        }
        
        priceLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(67)
            $0.trailing.equalTo(savedBtn.snp.trailing)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func setStackConstraints() {
        [productNameLabel, descriptionLabel].forEach {
            productTittleStackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        productNameLabel.snp.makeConstraints() {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints() {
            $0.top.equalTo(productNameLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(33)
        }
    }
    
    public func configure(with savedModel: SavedModel) {
        self.productImageView.image = UIImage(named: savedModel.productImage)
        self.productNameLabel.text = savedModel.productName
        self.descriptionLabel.text = savedModel.description
        self.priceLabel.text = savedModel.price
    }
}
