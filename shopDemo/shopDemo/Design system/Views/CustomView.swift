//
//  CustomButton.swift
//  shopDemo
//
//  Created by Павел on 19.03.23.
//

import SnapKit
import UIKit

final class CustomView: UIView {
    
    // MARK: - Private
    
    // MARK: Variables
    
    private var style: StyleButton?
    
    // MARK: UI
    
    private let title = UILabel()
    private let summ = UILabel()
        .decorated(with: .text("$ 1593"))
    private let arrow = UIImageView()
        .decorated(with: .image(UIImage(named: "arrow2")))
    private let icon = UIImageView()
    
    
    // MARK: - Initialization
    
    init(ofType type: StyleButton, title: String) {
        super.init(frame: .zero)
        
        self.style = type
        self.title.decorated(with: .text(title))
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CustomView {
    
    func setupView() {
        addSubview(icon)
        icon.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.width.equalTo(40)
        }
        addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.equalTo(icon.snp.trailing).offset(7.78)
            make.centerY.equalToSuperview()
        }
        switch style {
        case .arrow:
            icon.decorated(with: .image(UIImage(named: "icon1")))
            addArrow()
            addSubview(arrow)
        case .summ:
            icon.decorated(with: .image(UIImage(named: "icon1")))
            addSubview(summ)
            summ.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(13.5)
                make.centerY.equalToSuperview()
            }
        case .help:
            icon.decorated(with: .image(UIImage(named: "icon3")))
        case .logOut:
            icon.decorated(with: .image(UIImage(named: "icon4")))
        case .restore:
            icon.decorated(with: .image(UIImage(named: "icon2")))
            addArrow()
        default:
            break
        }
    }
    
    func addArrow() {
        addSubview(arrow)
        arrow.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(13.5)
            make.top.equalToSuperview().offset(13)
            make.height.equalTo(15)
            make.width.equalTo(12)
        }
    }
    
}

// MARK: - Constants

extension CustomView {

    enum StyleButton {
        case arrow
        case summ
        case nothing
        case help
        case logOut
        case restore
    }

}
