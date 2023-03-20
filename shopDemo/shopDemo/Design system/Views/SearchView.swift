//
//  SearchView.swift
//  shopDemo
//
//  Created by Павел on 20.03.23.
//

import SnapKit
import UIKit

protocol SearchViewProtocol {
    func changesTextFild(text: String?)
}

final class SearchView: UIView {
    
    var delegat: SearchViewProtocol?

    // MARK: - Private

    // MARK: Variables

    // MARK: UI
    
    private let imageSearch = UIImageView(image: UIImage(named: "searchMy.pdf"))
    private let buttonClose = UIButton()
        .decorated(with: .image(UIImage(systemName: "multiply.circle")))
        .decorated(with: .tintColor(.gray4))
    private let textfield = UITextField()
        .decorated(with: .textColor(.gray4))
        .decorated(with: .font(.sf(.caption11())))
        .decorated(with: .placeholder("What are you looking for?"))
        .decorated(with: .alignment(.center))

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
        setupEction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension SearchView {
    
    func setupView() {
        backgroundColor = .gray5
        layer.cornerRadius = 12
    }
    
    func setupLayout() {
        addSubview(imageSearch)
        imageSearch.snp.makeConstraints { make in
            make.width.height.equalTo(12)
            make.top.equalToSuperview().offset(5.5)
            make.trailing.equalToSuperview().inset(17.5)
        }
        addSubview(textfield)
        textfield.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(29.5)
            make.leading.equalToSuperview().offset(15)
        }
        
    }
    
    func addCloseButton() {
        addSubview(buttonClose)
        buttonClose.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(15)
        }
    }
    
    func setupEction() {
        textfield.addTarget(self, action: #selector(textFieldDidChange(_:)),
                            for: .editingChanged)
        buttonClose.addAction(for: .touchUpInside) { [weak self] _ in
            self?.textfield.text = ""
            self?.buttonClose.removeFromSuperview()
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text?.count else { return }
        
        text > 0 ? addCloseButton() : buttonClose.removeFromSuperview()
        delegat?.changesTextFild(text: textField.text)
    }
    
}

