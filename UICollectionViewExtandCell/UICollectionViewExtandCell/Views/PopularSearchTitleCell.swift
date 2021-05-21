//
//  PopularSearchTitleCell.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/20.
//

import UIKit

final class PopularSearchTitleCell: BaseCollectionViewCell {
    
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
    
    private let termLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .label
    }
    
    private let expandAndCollapseButton = UIButton().then {
        $0.setImage(Image.expandImage, for: .normal)
        $0.setImage(Image.collapseImage, for: .selected)
        $0.tintColor = .label
    }
    
    private let dividerView = DividerView()
    
    private var second: Int = 0
    private var timer: Timer = Timer()
    private var isTimerOn: Bool = false
    
    // MARK: - Initialization
    
    override func setupViews() {
        configure()
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        contentView.addSubviews(
            titleLabel,
            termLabel,
            dividerView,
            expandAndCollapseButton
        )
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(20)
        }
        
        termLabel.snp.makeConstraints {
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
    
    func bind(data: PopularSearch) {
        expandAndCollapseButton.isSelected = data.isExpand
        titleLabel.text = data.title
        titleLabel.isHidden = data.isExpand
        
        if data.isExpand == true {
            timer.invalidate()
            second = 0
            isTimerOn = false
            termLabel.text = data.title
        } else {
            if isTimerOn == false {
                isTimerOn = true
                timer = Timer.scheduledTimer(
                    withTimeInterval: 1,
                    repeats: true,
                    block: { _ in
                        self.termLabel.text = "\(self.second + 1). \(data.terms[self.second])"
                        self.second += 1
                        if self.second == data.terms.count {
                            self.second = 0
                        }
                    }
                )
            }
        }
    }
}
