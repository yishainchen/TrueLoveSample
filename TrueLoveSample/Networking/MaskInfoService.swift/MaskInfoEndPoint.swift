//
//  MaskInfoEndPoint.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

enum MaskInfoEndPoint {
    case search
}

extension MaskInfoEndPoint: EndPointType {
    var task: HTTPTask {
        return .request
    }
    
    private var baseURLString: String {
        return "https://raw.githubusercontent.com/kiang/pharmacies/master"
    }
    
    var baseURL: URL {
        guard let url = URL(string: baseURLString) else {
            fatalError("baseURL could not be configured")
        }
        return url
    }
    
    var path: String {
        return "/json/points.json"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}
