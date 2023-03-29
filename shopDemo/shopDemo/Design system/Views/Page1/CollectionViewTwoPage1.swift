//
//  CollectionViewTwoPage1.swift
//  shopDemo
//
//  Created by Павел on 20.03.23.
//

import UIKit

protocol CollectionViewTwoPage1Delegate: AnyObject {
    
    func actionCollectionView(_ model: CollectionViewTwoPage1.Model)
    
}

final class CollectionViewTwoPage1: UIView {
    
    // MARK: Delegate
    
    weak var delegate: CollectionViewTwoPage1Delegate?
    
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
        collectionView.register(CollectionViewTwoCellPage1.self, forCellWithReuseIdentifier: CollectionViewTwoCellPage1.identifier)
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
    
    func setup(with actions: [CollectionViewTwoPage1.Model]) {
        self.actions = actions
        collectionView.reloadData()
    }
    
}

private extension CollectionViewTwoPage1 {
    
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
        collectionViewFlowLayout.itemSize = CGSize(width: 114, height: 149)
        collectionViewFlowLayout.minimumInteritemSpacing = 12
        
        return collectionViewFlowLayout
    }
}

extension CollectionViewTwoPage1: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewTwoCellPage1.identifier,
            for: indexPath) as? CollectionViewTwoCellPage1 else {
            return UICollectionViewCell() }
        
        let action = actions[indexPath.row]
        cell.setupCell(with: action)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.actionCollectionView(actions[indexPath.row])
    }
    
}

extension CollectionViewTwoPage1 {
    
    struct Model {
        let name: String
        let image: String
        let category: Category
        let prise: String
    }
    
    enum Category: String {
        case game = "Games"
        case phone = "Phones"
        case card = "Cars"
        case kids = "Kids"
    }
    
}
