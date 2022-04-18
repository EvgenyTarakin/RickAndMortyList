//
//  UnitModel.swift
//  RickAndMortyList
//
//  Created by Евгений Таракин on 16.04.2022.
//

import Foundation

struct UnitModel {
    let name: String?
    let species: String?
    let gender: String?
    let image: URL?
    
    let status: String?
    let episode: [String]?
    let location: String?
}


struct LocationModel {
    let name: String?
}
