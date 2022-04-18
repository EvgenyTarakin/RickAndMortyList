//
//  UnitTableViewCell.swift
//  RickAndMortyList
//
//  Created by Евгений Таракин on 16.04.2022.
//

import UIKit
import SnapKit
import Kingfisher

class UnitTableViewCell: UITableViewCell {
    
    // MARK: property
    static let reuseIdentifier = String(describing: UnitTableViewCell.self)
    
    private lazy var backView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [avatarView, labelsStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var avatarView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, additionalInfoStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var additionalInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [speciesLabel, genderLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        
        return stackView
    }()
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var sepatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        return view
    }()

    // MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIdentifire: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifire)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarView.layer.cornerRadius = 10
        avatarView.layer.masksToBounds = true
    }
    
    // MARK: private func
    private func commonInit() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
        }
        
        backView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.left.right.equalToSuperview()
        }
        
        avatarView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalTo(avatarView.snp.height)
        }
        
        contentView.addSubview(sepatorView)
        sepatorView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    // MARK: func
    func configurate(_ unit: UnitModel) {
        nameLabel.text = unit.name
        genderLabel.text = unit.gender
        speciesLabel.text = unit.species
        avatarView.kf.setImage(with: unit.image, placeholder: UIImage(), options: [.transition(.fade(0.7))], progressBlock: nil)
    }
    
}
