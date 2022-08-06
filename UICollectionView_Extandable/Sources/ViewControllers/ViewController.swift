//
//  ViewController.swift
//  UICollectionView_Extandable
//
//  Created by Jmy on 2022/06/21.
//

import SnapKit
import Then
import UIKit

final class ViewController: UIViewController {
    // MARK: - Views

    private lazy var presentButton = UIButton().then {
        $0.setTitle("Present", for: .normal)
        $0.setTitleColor(.label, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        $0.addTarget(self, action: #selector(presentButtonTouched(_:)), for: .touchUpInside)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    // MARK: - Methods

    private func setupViews() {
        view.backgroundColor = .systemBackground

        view.addSubview(presentButton)

        presentButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    @objc private func presentButtonTouched(_ sender: Any) {
        let rootViewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.isNavigationBarHidden = true
        present(navigationController, animated: true)
    }
}
