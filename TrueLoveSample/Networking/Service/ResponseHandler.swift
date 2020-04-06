//
//  ResponseHandler.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol NetworkResponseHandler {
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Void>
}

extension NetworkResponseHandler {
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Void> {
        switch response.statusCode {
        case 200:
            return .success(())
        case 400, 500...599:
            return .failure(NetworkResponse.badRequest)
        default:
            return .failure(NetworkResponse.failed)
        }
    }
}


struct ResponseHandler: NetworkResponseHandler {

    func handleResponse(data: Data?, _ response: URLResponse?, error: Error?) -> Result<JSONFormat> {
        if let error = error {
            if (error as NSError).code == NSURLErrorCancelled {
                return .failure(NetworkResponse.cancelled)
            } else if (error as NSError).code == NSURLErrorNotConnectedToInternet {
                return .failure(NetworkResponse.networkConnectionIssue)
            }
        }
        
        if let response = response as? HTTPURLResponse {
            let result = self.handleNetworkResponse(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    return .failure(NetworkResponse.noData)
                }
                do {
                    guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? JSONFormat else {
                        return .failure(NetworkResponse.unableToDecode)
                    }
                    return .success(json)
                } catch {
                    return .failure(NetworkResponse.failed)
                }
            case .failure(let error):
                return .failure(error)
            }
        }

        return .failure(NetworkResponse.failed)
    }

}
