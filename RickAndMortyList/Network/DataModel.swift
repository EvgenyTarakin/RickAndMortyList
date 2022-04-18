//
//  DataModel.swift
//  RickAndMortyList
//
//  Created by Евгений Таракин on 16.04.2022.
//

import Foundation

struct ResidentsResponseModel: Decodable {
    let info: InfoResponseModel?
    let results: [ResidentResponseModel]?
}

struct InfoResponseModel: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct ResidentResponseModel: Decodable {
    let name: String?
    let gender: String?
    let species: String?
    let image: URL?
    
    let status: String?
    let episode: [String]?
    let location: LocationResponseModel?
}

struct LocationResponseModel: Decodable {
    let name: String?
}
