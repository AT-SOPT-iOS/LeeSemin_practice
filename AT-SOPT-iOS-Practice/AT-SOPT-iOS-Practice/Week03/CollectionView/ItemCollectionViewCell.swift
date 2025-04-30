//
//  ItemCollectionViewCell.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/26/25.
//

import UIKit

final class ItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemCollectionViewCell"
    
    private let itemImageView = UIImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .subhead2
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 255/255, green: 126/255, blue: 54/255, alpha: 1)
        label.font = .subhead3
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(.blackHeart, for: .normal)
        button.setImage(.redHeart, for: .selected)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
        setAddTarget()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .white
    }
    
    private func setUI() {
        [itemImageView, nameLabel, priceLabel, heartButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(13)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(13)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
    
    private func setAddTarget(){
        heartButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
}

extension ItemCollectionViewCell {
    func configure(_ item: ItemModel) {
        itemImageView.image = item.item
        nameLabel.text = item.name
        priceLabel.text = item.price + "원"
        heartButton.isSelected = item.isLiked
    }
    
    @objc private func likeButtonTapped() {
        heartButton.isSelected.toggle()
    }
}
