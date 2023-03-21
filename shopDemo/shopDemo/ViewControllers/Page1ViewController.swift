//
//  Page1ViewController.swift
//  shopDemo
//
//  Created by Павел on 16.03.23.
//

import SnapKit
import UIKit

class Page1ViewController: UIViewController {

    var viewModel: Page1ViewModel!

    private let titleViewCustom = UIView()
    private let profileImageButton = UIButton(type: .custom)
    private let locationView = makeLocetionView()
    private let searchBar = SearchView()
    private let category = CollectionViewPage1()
    private let titleLatest = UILabel()
        .decorated(with: .text(Constants.titleLatest))
        .decorated(with: .font(.sf(.h4([.semibold]))))
    private let viewAll = UILabel()
        .decorated(with: .text(Constants.viewAll))
        .decorated(with: .font(.sf(.caption11([.semibold]))))
        .decorated(with: .textColor(.gray4))
    private let latest = CollectionViewTwoPage1()
    private let titleFlash = UILabel()
        .decorated(with: .text(Constants.titleFlash))
        .decorated(with: .font(.sf(.h4([.semibold]))))
    private let viewAllTwo = UILabel()
        .decorated(with: .text(Constants.viewAll))
        .decorated(with: .font(.sf(.caption11([.semibold]))))
        .decorated(with: .textColor(.gray4))
    private let flash = CollectionViewThreePage1()
    private let brend = UILabel()
        .decorated(with: .text(Constants.brend))
        .decorated(with: .font(.sf(.h4([.semibold]))))
    private let breanAllTwo = UILabel()
        .decorated(with: .text(Constants.viewAll))
        .decorated(with: .font(.sf(.caption11([.semibold]))))
        .decorated(with: .textColor(.gray4))
    private let brends = CollectionViewTwoPage1()
    private let scrolleView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    private let contentView = UIView()

    override func loadView() {
        super.loadView()

        setupTitleView()
        setupView()
        setupLayout()
        setupButtonAction()
        setupCollectionView()
        setupCollectionLatesView()
        setupCollectionFlashView()
    }

}

private extension Page1ViewController {

    func setupView() {
        view.backgroundColor = .mainColor
        navigationItem.titleView = titleViewCustom
        navigationItem.leftBarButtonItem = makeUIBarButtonItemLeft()
        navigationItem.rightBarButtonItem = makeUIBarButtonItemRight()
        searchBar.delegat = self
        latest.delegate = self
        flash.delegate = self
    }

    func setupLayout() {
        [locationView, searchBar, category, scrolleView].forEach { view.addSubview($0) }
        
        locationView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(23)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.width.equalTo(50)
            make.height.equalTo(8)
        }
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(locationView.snp.bottom).offset(10.91)
            make.trailing.leading.equalToSuperview().inset(56)
            make.height.equalTo(24)
        }
        category.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(17)
            make.trailing.leading.equalToSuperview().inset(15)
            make.height.equalTo(65)
        }
        scrolleView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(11)
            make.top.equalTo(category.snp.bottom).offset(34.5)
            make.bottom.equalToSuperview()
        }
        setupLayoutScrollView()
    }
    
    func setupLayoutScrollView() {
        scrolleView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
            make.height.equalTo(680)
        }
        
        [titleLatest, viewAll, latest, titleFlash, viewAllTwo, flash, brend, breanAllTwo, brends].forEach { contentView.addSubview($0) }
        
        titleLatest.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(11.55)
        }
        viewAll.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.trailing.equalToSuperview().inset(12.92)
        }
        latest.snp.makeConstraints { make in
            make.top.equalTo(titleLatest.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        titleFlash.snp.makeConstraints { make in
            make.top.equalTo(latest.snp.bottom).offset(22)
            make.leading.equalToSuperview().inset(11.55)
        }
        viewAllTwo.snp.makeConstraints { make in
            make.top.equalTo(latest.snp.bottom).offset(26)
            make.trailing.equalToSuperview().inset(12.92)
        }
        flash.snp.makeConstraints { make in
            make.top.equalTo(titleFlash.snp.bottom).offset(8.86)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(221)
        }
        brend.snp.makeConstraints { make in
            make.top.equalTo(flash.snp.bottom).offset(22)
            make.leading.equalToSuperview().inset(11.55)
        }
        breanAllTwo.snp.makeConstraints { make in
            make.top.equalTo(flash.snp.bottom).offset(26)
            make.trailing.equalToSuperview().inset(12.92)
        }
        brends.snp.makeConstraints { make in
            make.top.equalTo(breanAllTwo.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
    }
    
    func setupCollectionView() {
        let arrayColection: [CollectionViewPage1.Model] = [
            CollectionViewPage1.Model(
                name: "Phones",
                image: UIImage(named: "categoryNew1")
            ),
            CollectionViewPage1.Model(
                name: "Headphones",
                image: UIImage(named: "categoryNew2")
            ),
            CollectionViewPage1.Model(
                name: "Games",
                image: UIImage(named: "categoryNew3")
            ),
            CollectionViewPage1.Model(
                name: "Cars",
                image: UIImage(named: "categoryNew4")
            ),
            CollectionViewPage1.Model(
                name: "Furniture",
                image: UIImage(named: "categoryNew5")
            ),
            CollectionViewPage1.Model(
                name: "kids",
                image: UIImage(named: "categoryNew6")
            )
            
        ]
        category.setup(with: arrayColection)
    }
    
    func setupCollectionFlashView() {
        let arrayColection: [CollectionViewThreePage1.Model] = [
            CollectionViewThreePage1.Model(
                name: "New balanse sneaker",
                image: nil,
                category: .kids,
                prise: "$ 33.00"
                ),
            CollectionViewThreePage1.Model(
                name: "New balanse sneaker",
                image: nil,
                category: .kids,
                prise: "$ 22.50"
                ),
            CollectionViewThreePage1.Model(
                name: "New balanse sneaker",
                image: nil,
                category: .kids,
                prise: "$ 10.50"
                )
            ]
        flash.setup(with: arrayColection)
    }
                
    func setupCollectionLatesView() {
        let arrayColection: [CollectionViewTwoPage1.Model] = [
            CollectionViewTwoPage1.Model(
                name: "Samsung S10",
                image: nil,
                category: .phone,
                prise: "$ 180.0000"
            ),
            CollectionViewTwoPage1.Model(
                name: "Play Station 5 console",
                image: nil,
                category: .game,
                prise: "$ 90.0000"
            ),
            CollectionViewTwoPage1.Model(
                name: "Play Station 5 console",
                image: nil,
                category: .game,
                prise: "$ 100.0000"
            ),
            CollectionViewTwoPage1.Model(
                name: "Play Station 5 console",
                image: nil,
                category: .game,
                prise: "$ 100.0000"
            )
        ]
        latest.setup(with: arrayColection)
        brends.setup(with: arrayColection)
    }
    
    static func makeSearchView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray5
        view.layer.cornerRadius = 12
        let image = UIImageView(image: UIImage(named: "searchMy.pdf"))
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.width.height.equalTo(12)
            make.top.equalToSuperview().offset(5.5)
            make.trailing.equalToSuperview().inset(17.5)
        }
        
        let textfield = UITextField()
            .decorated(with: .textColor(.gray4))
            .decorated(with: .font(.sf(.caption8())))
            .decorated(with: .placeholder("What are you looking for?"))
            .decorated(with: .alignment(.center))
        
        view.addSubview(textfield)
        textfield.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(29.5)
            make.leading.equalToSuperview().offset(10)
        }
        
        return view
    }

    func setupButtonAction() {
        profileImageButton.addAction(for: .touchUpInside) { [weak self] _ in
            self?.viewModel.goToProfile()
        }
    }

    func setupTitleView() {
        let fullTitle = UIView()
        let leftPartTitle = UILabel()
            .decorated(with: .text(Constants.leftPartTitle))
            .decorated(with: .font(.sf(.h5([.bold]))))
        let rightPartTitle = UILabel()
            .decorated(with: .text(Constants.rightPartTitle))
            .decorated(with: .font(.sf(.h5([.bold]))))
            .decorated(with: .textColor(.blue2))
        fullTitle.addSubview(leftPartTitle)
        fullTitle.addSubview(rightPartTitle)
        leftPartTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-3)
            make.leading.equalToSuperview().inset(-5)
        }
        rightPartTitle.snp.makeConstraints { make in
            make.top.equalTo(leftPartTitle.snp.top)
            make.leading.equalTo(leftPartTitle.snp.trailing).offset(5)
        }
        titleViewCustom.addSubview(fullTitle)
        fullTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(132)
            make.height.equalTo(19)
        }
    }

    func setupRightButtonPhoto() {
        profileImageButton.frame = CGRect(x: 0.0, y: 0, width: 31, height: 29)
        profileImageButton.layer.borderWidth = 1
        profileImageButton.layer.borderColor = UIColor.borderColor2.cgColor
        profileImageButton.layer.cornerRadius = profileImageButton.frame.width / 2
        profileImageButton.imageView?.contentMode = .scaleAspectFill
    }

    func makeUIBarButtonItemRight() -> UIBarButtonItem {
        setupRightButtonPhoto()

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 31, height: 29))
        view.bounds = view.bounds.offsetBy(dx: 20, dy: 0)
        view.addSubview(profileImageButton)

        let rightPhoto = UIBarButtonItem(customView: view)
        rightPhoto.customView?.widthAnchor.constraint(equalToConstant: 31).isActive = true
        rightPhoto.customView?.heightAnchor.constraint(equalToConstant: 29).isActive = true

        return rightPhoto
    }

    func makeUIBarButtonItemLeft() -> UIBarButtonItem {
        let buttonLeft = UIButton()
            .decorated(with: .image(Constants.buttonLeftImage))
        buttonLeft.heightAnchor.constraint(equalToConstant: 24).isActive = true
        buttonLeft.widthAnchor.constraint(equalToConstant: 22).isActive = true
        buttonLeft.contentHorizontalAlignment = .left

        let button = UIBarButtonItem(customView: buttonLeft)
        return button
    }

    static func makeLocetionView() -> UIView {
        let view = UIView()
        let title = UILabel()
            .decorated(with: .text(Constants.locationTitle))
            .decorated(with: .textColor(.gray4))
            .decorated(with: .font(.sf(.caption8())))
        let image = UIImageView()
            .decorated(with: .image(UIImage(named: "arrowDoun")))

        view.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.leading.equalTo(title.snp.trailing).offset(1)
            make.top.equalToSuperview().offset(2)
            make.width.equalTo(9)
            make.height.equalTo(7)
        }

        return view
    }

}

// MARK: CollectionViewTwoPage1Delegate

extension Page1ViewController: CollectionViewTwoPage1Delegate {
    
    func actionCollectionView(_ model: CollectionViewTwoPage1.Model) {
        viewModel.openPage2()
    }
    
}

extension Page1ViewController: CollectionViewThreePage1Delegate {
    
    func actionCollectionTwoView(_ model: CollectionViewThreePage1.Model) {
        viewModel.openPage2()
    }
    
}

extension Page1ViewController: SearchViewProtocol {
    
    func changesTextFild(text: String?) {
        guard let text else { return  }
        
        viewModel.sendTextTextField(text: text)
    }
    
}

// MARK: - Constants

private extension Page1ViewController {

    enum Constants {
        static let leftPartTitle = "Trade by"
        static let rightPartTitle = "bata"
        static let locationTitle = "Location"
        static let buttonLeftImage = UIImage(named: "clip.pdf")
        static let titleLatest = "Latest"
        static let viewAll = "View all"
        static let titleFlash = "Flash Sale"
        static let brend = "Brends"
    }

}
