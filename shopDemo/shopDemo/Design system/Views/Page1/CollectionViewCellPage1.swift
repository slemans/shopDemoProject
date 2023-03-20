//
//  CollectionViewCellPage1.swift
//  shopDemo
//
//  Created by Павел on 20.03.23.
//

import UIKit

final class CollectionViewCellPage1: UICollectionViewCell {
    
    // MARK: - UI

    private let title = UILabel()
        .decorated(with: .textColor(.gray6))
        .decorated(with: .font(.sf(.caption8([.semibold]))))
        .decorated(with: .alignment(.center))
    private let viewImage = UIView()
    private let imageView = UIImageView()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions

    func setupCell(with model: CollectionViewPage1.Model) {
        title.decorated(with: .text(model.name))
        imageView.decorated(with: .image(model.image))
    }

}

private extension CollectionViewCellPage1 {
    
    func setupUI() {
        viewImage.backgroundColor = .gray7
        viewImage.layer.cornerRadius = 21
    }
    
    func setupLayout() {
        addSubview(viewImage)
        viewImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(42)
        }
        
        viewImage.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()        }
        
       addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalTo(viewImage.snp.bottom).offset(14.08)
            make.leading.trailing.equalToSuperview()
        }
        
    }
    
}
