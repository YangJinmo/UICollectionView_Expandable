//
//  SearchViewController.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/20.
//

import UIKit
import Then
import SnapKit

final class SearchViewController: UIViewController {
    
    // MARK: - Constants
    
    private let searchTitleCellHeight: CGFloat = 76
    private let searchTermCellHeight: CGFloat = 44
    
    // MARK: - UI
    
    private lazy var collectionView = BaseCollectionView(layout: flowLayout()).then {
        $0.dataSource = self
        $0.delegate = self
        $0.register(SearchTitleCell.self)
        $0.register(SearchTermCell.self)
    }
    
    private var searches = [Search]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        createDummyDatas()
    }
    
    // MARK: - UIViewControllerTransitionCoordinator
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
    }
    
    private func createDummyDatas() {
        searches = [
            Search(
                isExpand: false,
                title: "인기 검색",
                terms: ["캠핑", "가방", "고양이", "건전지", "오미자"]
            ),
            Search(
                isExpand: false,
                title: "최근 검색",
                terms: ["충전기", "강아지", "개구리", "두꺼비", "아이유"]
            ),
            Search(
                isExpand: false,
                title: "연관 검색",
                terms: ["보충제", "고구마", "헬스장", "런닝머신", "다이어트"]
            )
        ]
    }
}

// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searches[section].isExpand == true {
            return searches[section].terms.count + 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell: SearchTitleCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.bind(data: searches[indexPath.section])
            return cell
        default:
            let cell: SearchTermCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.bind(
                rank: indexPath.item,
                term: searches[indexPath.section].terms[indexPath.item - 1]
            )
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            searches[indexPath.section].isExpand.toggle()
            
            let sections: IndexSet = IndexSet(integer: indexPath.section)
            collectionView.reloadSections(sections)
        } else {
            print(searches[indexPath.section].terms[indexPath.item - 1])
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return itemSize(width: collectionView, height: searchTitleCellHeight)
        default:
            return itemSize(width: collectionView, height: searchTermCellHeight)
        }
    }
}

extension SearchViewController: FlowLayoutMetric {
    var numberOfItemForRow: CGFloat {
        1
    }
    
    var inset: CGFloat {
        20
    }
    
    var lineSpacing: CGFloat {
        1
    }
    
    var interItemSpacing: CGFloat {
        0
    }
}
