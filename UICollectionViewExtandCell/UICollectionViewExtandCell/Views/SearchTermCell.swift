//
//  SearchTermCell.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/20.
//

import UIKit

final class SearchTermCell: BaseCollectionViewCell {
    
    // MARK: - UI
    
    private let rankLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .label
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .label
    }
    
    // MARK: - Initialization
    
    override func setupViews() {
        configure()
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        contentView.addSubviews(
            rankLabel,
            titleLabel
        )
        
        rankLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(rankLabel.snp.right).offset(20)
        }
    }
    
    // MARK: - Internal Methods
    
    func bind(rank: Int, term: String) {
        rankLabel.text = "\(rank)"
        titleLabel.text = term
    }
}
