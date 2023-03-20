//
//  CollectionViewThreePage1.swift
//  shopDemo
//
//  Created by Павел on 20.03.23.
//

import UIKit

final class CollectionViewThreePage1: UIView {
    
    // MARK: - Private
    
    // MARK: Variables
    
    private var actions: [Model] = []
    
    // MARK: UI
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout())
        collectionView.backgroundColor = .mainColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CollectionViewThreeCellPage1.self, forCellWithReuseIdentifier: CollectionViewThreeCellPage1.identifier)
        return collectionView
    }()
    
    // MARK: - Public
    
    // MARK: Initialization
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functions
    
    func setup(with actions: [CollectionViewThreePage1.Model]) {
        self.actions = actions
    }
    
}

private extension CollectionViewThreePage1 {
    
    func setupView() {
        
    }
    func setupLayout() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
    
    func collectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: 174, height: 221)
        collectionViewFlowLayout.minimumInteritemSpacing = 9
        
        return collectionViewFlowLayout
    }
}

extension CollectionViewThreePage1: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewThreeCellPage1.identifier,
            for: indexPath) as? CollectionViewThreeCellPage1 else {
            return UICollectionViewCell() }
        
        let action = actions[indexPath.row]
        cell.setupCell(with: action)
        return cell
    }
    
}

extension CollectionViewThreePage1 {
    
    struct Model {
        let name: String
        let image: UIImage?
        let category: CollectionViewTwoPage1.Category
        let prise: String
    }
    
}

