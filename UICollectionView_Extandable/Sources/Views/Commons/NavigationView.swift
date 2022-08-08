//
//  NavigationView.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/08/06.
//

import SnapKit
import Then
import UIKit

final class NavigationView: BaseView {
    // MARK: - Properties

    private enum Image {
        static let chevronLeft = UIImage(systemName: "chevron.left")
        static let xmark = UIImage(systemName: "xmark")
    }

    private var popButtonTouch: CompletionHandler?
    private var dismissButtonTouch: CompletionHandler?

    // MARK: - Views

    private lazy var titleLabel = UILabel.title()
    private lazy var popButton: UIButton = {
        let button = UIButton(Image.chevronLeft)
        button.isHidden = true
        button.addTarget(self, action: #selector(popButtonTouched), for: .touchUpInside)
        return button
    }()

    private lazy var dismissButton: UIButton = {
        let button = UIButton(Image.xmark)
        button.isHidden = true
        button.addTarget(self, action: #selector(dismissButtonTouched), for: .touchUpInside)
        return button
    }()

    // MARK: - View Life Cycle

    override func commonInit() {
        addSubviews(
            popButton,
            dismissButton,
            titleLabel
        )

        popButton.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(navigationBarHeight)
        }

        dismissButton.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(navigationBarHeight)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(navigationBarHeight)
        }
    }

    // MARK: - Methods

    func setNavigationViewBottomShadow() {
        backgroundColor = .systemBackground
        setBottomShadow()
    }

    func setTitleLabel(_ text: String?) {
        titleLabel.text = text
    }

    func addPopButton(_ popButtonTouch: CompletionHandler?) {
        self.popButtonTouch = popButtonTouch

        popButton.isHidden = false
    }

    func addDismissButton(_ dismissButtonTouch: CompletionHandler?) {
        self.dismissButtonTouch = dismissButtonTouch

        dismissButton.isHidden = false
    }

    @objc private func popButtonTouched() {
        popButtonTouch?()
    }

    @objc private func dismissButtonTouched() {
        dismissButtonTouch?()
    }
}
