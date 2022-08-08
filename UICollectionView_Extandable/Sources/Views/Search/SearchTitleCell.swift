//
//  SearchTitleCell.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2021/05/20.
//

import SnapKit
import Then
import UIKit

final class SearchTitleCell: BaseCollectionViewCell {
    // MARK: - Constants

    static let itemHeight: CGFloat = 76

    private struct Image {
        static let chevronDownImage = UIImage(systemName: "chevron.down")
        static let chevronUpImage = UIImage(systemName: "chevron.up")
    }

    // MARK: - Variables

    private var timer: Timer?
    private var index = 0

    // MARK: - Views

    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }

    private lazy var termLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }

    private lazy var chevronButton = UIButton().then {
        $0.setImage(Image.chevronDownImage, for: .normal)
        $0.setImage(Image.chevronUpImage, for: .selected)
        $0.tintColor = .label
        $0.isUserInteractionEnabled = false
    }

    private lazy var dividerView = DividerView()

    // MARK: - View Life Cycle

    override class func awakeFromNib() {
        super.awakeFromNib()

        "".log()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        "".log()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        "".log()
    }

    override func removeFromSuperview() {
        removeTimer()

        super.removeFromSuperview()

        "".log()
    }

    deinit {
        Self.identifier.log()
    }

    // MARK: - Methods

    override func commonInit() {
        contentView.addSubviews(
            titleLabel,
            termLabel,
            dividerView,
            chevronButton
        )

        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(36)
        }

        termLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        dividerView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
        }

        chevronButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(36)
        }
    }

    // MARK: - Methods

    // TODO: Add Timer in model
    public func bind(search: Search) {
        search.isExpand.description.log()

        chevronButton.isSelected = search.isExpand
        titleLabel.text = search.title
        titleLabel.isHidden = search.isExpand

        if search.isExpand {
            removeTimer()
            index = 0
            termLabel.text = search.title
        } else {
            createTimer(search: search)
        }
    }

    private func setTermLabelText(search: Search, index: Int) {
        termLabel.text = "\(index + 1). \(search.terms[index])"
        "\(index + 1). \(search.terms[index])".log()
    }

    private func createTimer(search: Search) {
        removeTimer()

        setTermLabelText(search: search, index: index) // Default

        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(update), userInfo: search, repeats: true)
    }

    @objc private func update(_ timer: Timer) {
        guard let search = timer.userInfo as? Search else { return }

        setTermLabelText(search: search, index: index)
        index += 1

        if index == search.terms.count {
            index = 0
        }
    }

    public func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
}
