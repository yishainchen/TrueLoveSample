//
//  MaskInfoService.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

enum NetworkResponse: Int, LocalizedError {
    case success
    case badRequest
    case failed
    case noData
    case unableToDecode
    case networkConnectionIssue = -1009
    case cancelled
}

typealias JSONFormat = [String: Any]

struct MaskInfoService {
    private let router = NetworkDefaultRouter<MaskInfoEndPoint>()
    
    func fetchMaskStorageInfo(with completion: @escaping (_ json: [MaskStorage]?, _ error: Error?) -> Void) {
        
        router.request(.search) { (data, response, error) in
            let result = ResponseHandler().handleResponse(data: data, response, error: error)
            switch result {
            case .success(let json):
                if let features = json["features"] as? [JSONFormat],
                    let data = try? JSONSerialization.data(withJSONObject: features, options: .prettyPrinted),
                    let markResponse = try? JSONDecoder().decode([MaskStorage].self, from: data) {
                    completion(markResponse, nil)
                } else {
                    completion(nil, NetworkResponse.unableToDecode)
                }
            case .failure(let error):
                completion(nil, error)
            }
            
            
        }
    }
}
