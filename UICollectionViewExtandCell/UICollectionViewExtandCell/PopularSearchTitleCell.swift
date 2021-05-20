//
//  PopularSearchTitleCell.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/20.
//

import UIKit

class PopularSearchTitleCell: BaseCollectionViewCell {
    
    // MARK: - Private Constants
    
    private struct Image {
        static let expandImage = UIImage(systemName: "chevron.down")
        static let collapseImage = UIImage(systemName: "chevron.up")
    }
    
    // MARK: - UI
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .label
    }
    
    private let expandAndCollapseButton = UIButton().then {
        $0.setImage(Image.expandImage, for: .normal)
        $0.setImage(Image.collapseImage, for: .selected)
        $0.tintColor = .label
    }
    
    private let dividerView = DividerView()
    
    // MARK: - Life Cycle
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//    }
    
    // MARK: - Initialization
    
    override func setupViews() {
        configure()
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        addSubviews(
            titleLabel,
            dividerView,
            expandAndCollapseButton
        )
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
        }
        
        expandAndCollapseButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Internal Methods
    
    func bind(title: String) {
        titleLabel.text = title
    }
    
    // MARK: - Variables And Properties
    
    override var isSelected: Bool {
        didSet {
            expandAndCollapseButton.isSelected = isSelected
        }
    }
}
