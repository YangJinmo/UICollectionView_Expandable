//
//  SearchTitleCell.swift
//  UICollectionViewExtandCell
//
//  Created by Jmy on 2021/05/20.
//

import UIKit

final class SearchTitleCell: BaseCollectionViewCell {
    
    // MARK: - Private Constants
    
    private struct Image {
        static let chevronDownImage = UIImage(systemName: "chevron.down")
        static let chevronUpImage = UIImage(systemName: "chevron.up")
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
    
    private let chevronButton = UIButton().then {
        $0.setImage(Image.chevronDownImage, for: .normal)
        $0.setImage(Image.chevronUpImage, for: .selected)
        $0.tintColor = .label
        $0.isUserInteractionEnabled = false
    }
    
    private let dividerView = DividerView()
    
    private var timer: Timer = Timer()
    private var isTimerOn: Bool = false
    private var index: Int = 0
    
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
            chevronButton
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
        
        chevronButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Internal Methods
    
    func bind(data: Search) {
        chevronButton.isSelected = data.isExpand
        titleLabel.text = data.title
        titleLabel.isHidden = data.isExpand
        
        if data.isExpand == true {
            timer.invalidate()
            index = 0
            isTimerOn = false
            termLabel.text = data.title
        } else {
            termLabel.text = "\(index + 1). \(data.terms[index])"
            if isTimerOn == false {
                isTimerOn = true
                timer = Timer.scheduledTimer(
                    withTimeInterval: 2,
                    repeats: true,
                    block: { _ in
                        self.termLabel.text = "\(self.index + 1). \(data.terms[self.index])"
                        self.index += 1
                        if self.index == data.terms.count {
                            self.index = 0
                        }
                    }
                )
            }
        }
    }
}
