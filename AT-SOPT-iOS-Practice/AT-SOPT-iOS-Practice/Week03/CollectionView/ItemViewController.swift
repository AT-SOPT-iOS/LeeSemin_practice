//
//  ItemViewController.swift
//  AT-SOPT-iOS-Practice
//
//  Created by 이세민 on 4/26/25.
//

import UIKit

import SnapKit
import Then

final class ItemViewController: UIViewController {
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 49, left: 20, bottom: 10, right: 20)
    
    private let itemList = ItemModel.mockData
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setCollectionView()
        setDelegate()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        collectionView.register(
            ItemCollectionViewCell.self,
            forCellWithReuseIdentifier: ItemCollectionViewCell.identifier
        )
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension ItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return carrotLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return carrotInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return carrotInset
    }
}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return itemList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionViewCell.identifier,
            for: indexPath
        ) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(itemList[indexPath.row])
        return cell
    }
}
