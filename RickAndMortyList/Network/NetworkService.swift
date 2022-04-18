//
//  NetworkService.swift
//  RickAndMortyList
//
//  Created by Евгений Таракин on 16.04.2022.
//

import UIKit
import Alamofire

protocol ResidentsListNetworkServiceProtocol {
    func getResident(stringURL: String, onRequestCompleted: @escaping ((ResidentsResponseModel?, Error?) -> ()))
    func getImage(stringURL: String, onRequestCompleted: @escaping ((UIImage?, Error?) -> ()))
}

class NetworkService {
    
    private func performGetRequest<ResponseModel: Decodable>(urlString: String, method: HTTPMethod = .get, onRequestCompleted: @escaping ((ResponseModel?, Error?)->())) {
        AF.request(urlString,
                   method: method,
                   encoding: JSONEncoding.default
        ).response { (responseData) in
            guard responseData.error == nil,
                  let data = responseData.data
            else {
                onRequestCompleted(nil, responseData.error)
                return
            }
            do {
                let decodedValue: ResponseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                onRequestCompleted(decodedValue, nil)
            }
            catch (let error) {
                print("Response parsing error: \(error.localizedDescription)")
                onRequestCompleted(nil, error)
            }
        }
    }
    
}

extension NetworkService: ResidentsListNetworkServiceProtocol {
    func getResident(stringURL: String, onRequestCompleted: @escaping ((ResidentsResponseModel?, Error?) -> ())) {
        performGetRequest(urlString: stringURL, onRequestCompleted: onRequestCompleted)
    }
    
    func getImage(stringURL: String, onRequestCompleted: @escaping ((UIImage?, Error?) -> ())) {
        AF.request(stringURL, method: .get).response { (data) in
            if let data = data.data {
                onRequestCompleted(UIImage(data: data), nil)
                return
            }
            onRequestCompleted(nil, data.error)
        }
        
    }
}
