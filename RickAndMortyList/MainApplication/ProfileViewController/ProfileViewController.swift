//
//  ProfileViewController.swift
//  RickAndMortyList
//
//  Created by Евгений Таракин on 16.04.2022.
//

import UIKit
import Kingfisher

class ProfileViewController: UIViewController {

    // MARK: property
    private lazy var customNavigationBar: UIView = {
        let navigationBar = UIView()
        navigationBar.backgroundColor = .clear
        
        let separator = UIView()
        separator.backgroundColor = .gray
        navigationBar.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        navigationBar.addSubview(titleProfile)
        titleProfile.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
        
        return navigationBar
    }()
    
    private lazy var titleProfile: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var avatarProfileImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, speciesLabel, genderLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        
        return label
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
    
    private lazy var additionalInfoStackVeiw: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [statusLabel, lastLocation])
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var lastLocation: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var countEpisodeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(backToListVC), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configurateUI()
    }
    
    // MARK: private func
    private func configurateUI() {
        view.backgroundColor = .lightGray
        
        view.addSubview(customNavigationBar)
        customNavigationBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        view.addSubview(avatarProfileImage)
        avatarProfileImage.snp.makeConstraints { make in
            make.top.equalTo(customNavigationBar.snp.bottom).inset(-16)
            make.left.equalToSuperview().inset(16)
            make.height.width.equalTo(150)
        }
        
        view.addSubview(labelsStackView)
        labelsStackView.snp.makeConstraints { make in
            make.top.equalTo(customNavigationBar.snp.bottom).inset(-16)
            make.left.equalTo(avatarProfileImage.snp.right).inset(-16)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        view.addSubview(additionalInfoStackVeiw)
        additionalInfoStackVeiw.snp.makeConstraints { make in
            make.top.equalTo(avatarProfileImage.snp.bottom).inset(-16)
            make.left.right.equalToSuperview().inset(16)
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    // MARK: func
    func configurateProfile(_ profile: UnitModel) {
        guard let name = profile.name,
              let species = profile.species,
              let gender = profile.gender,
              let status = profile.status,
              let location = profile.location,
              let countEpisode = profile.episode?.count
        else { return }
        
        titleProfile.text = name
        nameLabel.text = "Name: " + name
        speciesLabel.text = "Species: " + species
        genderLabel.text = "Gender: " + gender
        statusLabel.text = "Status: " + status
        lastLocation.text = "Location: " + location
        countEpisodeLabel.text = "Number of episode: " + String(countEpisode)
        
        avatarProfileImage.kf.setImage(with: profile.image, placeholder: UIImage(), options: [.transition(.fade(0.7))], progressBlock: nil)
    }
    
    // MARK: obj-c
    @objc private func backToListVC() {
        navigationController?.popToRootViewController(animated: true)
    }

}
