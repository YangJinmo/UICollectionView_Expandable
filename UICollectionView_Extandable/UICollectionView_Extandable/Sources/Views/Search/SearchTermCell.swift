//
//  SearchTermCell.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2021/05/20.
//

import UIKit

final class SearchTermCell: BaseCollectionViewCell {
    // MARK: - Variables

    static var itemHeight: CGFloat {
        return 44
    }

    // MARK: - Views

    private let rankTermLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }

    // MARK: - Methods

    override func setupViews() {
        contentView.addSubviews(
            rankTermLabel
        )

        rankTermLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    func bind(rank: Int, term: String) {
        rankTermLabel.text = "\(rank). \(term)"
    }
}
