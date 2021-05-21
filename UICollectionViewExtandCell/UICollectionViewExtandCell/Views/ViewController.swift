//
//  ViewController.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/20.
//

import UIKit
import Then
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - Constants
    
    struct Metric {
        static let numberOfItemForRow: CGFloat = 1
        static let inset: CGFloat = 20
        static let lineSpacing: CGFloat = 10
        static let interItemSpacing: CGFloat = 4
        static let collectionWidth: CGFloat = UIScreen.main.bounds.width - (inset * 2)
        static let cellWidth: CGFloat = (collectionWidth - (interItemSpacing * (numberOfItemForRow - 1))) / numberOfItemForRow
        static let popularSearchTitleCellHeight: CGFloat = 76
        static let popularSearchTermCellHeight: CGFloat = 44
    }
    
    // MARK: - UI
    
    private let collectionViewLayout = UICollectionViewFlowLayout().then {$0.scrollDirection = .vertical
        $0.sectionInset = .init(top: 0, left: Metric.inset, bottom: 0, right: Metric.inset)
        $0.minimumLineSpacing = Metric.lineSpacing
        $0.minimumInteritemSpacing = Metric.interItemSpacing
    }
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: collectionViewLayout
    ).then {
        $0.backgroundColor = .systemBackground
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.register(PopularSearchTitleCell.self, forCellWithReuseIdentifier: PopularSearchTitleCell.description)
        $0.register(PopularSearchTermCell.self, forCellWithReuseIdentifier: PopularSearchTermCell.description)
    }
    
    private var datas = [PopularSearch]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        createDummyDatas()
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func createDummyDatas() {
        datas = [
            PopularSearch(
                isExpand: false,
                title: "인기 검색",
                terms: ["캠핑", "가방", "고양이", "건전지", "오미자"]
            ),
            PopularSearch(
                isExpand: false,
                title: "최근 검색",
                terms: ["충전기", "강아지", "개구리", "두꺼비", "아이유"]
            ),
            PopularSearch(
                isExpand: false,
                title: "연관 검색",
                terms: ["보충제", "고구마", "헬스장", "런닝머신", "다이어트"]
            )
        ]
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if datas[section].isExpand == true {
            return datas[section].terms.count + 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell: PopularSearchTitleCell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSearchTitleCell.description, for: indexPath) as! PopularSearchTitleCell
            
//            if datas[indexPath.section].isExpand == true {
//                cell.bind(
//                    isExpand: datas[indexPath.section].isExpand,
//                    title: datas[indexPath.section].title
//                )
//            } else {
//                cell.bind(
//                    isExpand: datas[indexPath.section].isExpand,
//                    title: datas[indexPath.section].terms[0]
//                )
//            }
            cell.bind(data: datas[indexPath.section])
            return cell
        default:
            let cell: PopularSearchTermCell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSearchTermCell.description, for: indexPath) as! PopularSearchTermCell
            
            cell.bind(
                rank: indexPath.item,
                term: datas[indexPath.section].terms[indexPath.item - 1]
            )
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        datas[indexPath.section].isExpand.toggle()
        
        let sections = IndexSet(integer: indexPath.section)
        collectionView.reloadSections(sections)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item {
        case 0:
            return CGSize(width: Metric.cellWidth, height: Metric.popularSearchTitleCellHeight)
        default:
            return CGSize(width: Metric.cellWidth, height: Metric.popularSearchTermCellHeight)
        }
    }
}
