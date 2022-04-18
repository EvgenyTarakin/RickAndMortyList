//
//  ViewController.swift
//  RickAndMortyList
//
//  Created by Евгений Таракин on 16.04.2022.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {

    // MARK: property
    private let networkService = NetworkService()
    private var tableData: [UnitModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(UnitTableViewCell.self, forCellReuseIdentifier: UnitTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurate()
        loadList()
        
    }
    
    // MARK: private func
    private func configurate() {
        view.backgroundColor = .lightGray

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func loadList() {
        networkService.getResident(stringURL: "https://rickandmortyapi.com/api/character") { [weak self] (results, error) in
            guard let results = results?.results,
                  let self = self
            else { return }
            
            self.tableData.append(contentsOf: results.map({ (resident) -> UnitModel in
                return UnitModel(name: resident.name, species: resident.species, gender: resident.gender, image: resident.image, status: resident.status, episode: resident.episode, location: resident.location?.name)
            }))
            
            self.tableView.reloadData()
        }
        
    }
    
}

// MARK: extension
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 7
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UnitTableViewCell.reuseIdentifier) as? UnitTableViewCell else { return UITableViewCell() }
        cell.configurate(tableData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ProfileViewController()
        controller.configurateProfile(tableData[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}
