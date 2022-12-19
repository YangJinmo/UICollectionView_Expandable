//
//  BaseTabViewController.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/08/06.
//

import SnapKit
import Then
import UIKit

class BaseTabViewController: BaseViewController {
    // MARK: - Properties

    override var title: String? {
        didSet {
            setTitleLabel(title)
        }
    }

    // MARK: - Views

    private lazy var navigationView = NavigationView()
    lazy var contentView = UIView()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    // MARK: - Methods

    private func setupViews() {
        view.backgroundColor = .systemBackground

        view.addSubviews(
            contentView,
            navigationView
        )

        navigationView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(navigationBarHeight)
        }

        contentView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }

    // MARK: - Navigation View

    func setTitleLabel(_ text: String?) {
        navigationView.setNavigationViewBottomShadow()
        navigationView.setTitleLabel(text)
    }

    func addPopButton() {
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationView.addPopButton(popButtonTouched)
    }

    func addDismissButton() {
        navigationView.addDismissButton(dismissButtonTouched)
    }

    @objc private func popButtonTouched() {
        popViewController()
    }

    @objc private func dismissButtonTouched() {
        dismiss()
    }
}

// MARK: - UIGestureRecognizerDelegate

extension BaseTabViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
