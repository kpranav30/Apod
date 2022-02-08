//
//  APIDataModel.swift
//  Apod
//
//  Created by Pranav Kulkarni on 2/7/22.
//

import Foundation

protocol APIDataModel {
    associatedtype DataModelType: Decodable
    var path: String { get }
    var queryParams : [String:String]? { get }
}

extension APIDataModel {
    var url: URL {
        var components = URLComponents(string: APIConstants.baseUrl.rawValue)!
        components.path = path
        if let queryParams = queryParams {
            components.queryItems = queryParams.map({ (key: String, value: String) in
                return URLQueryItem(name: key, value: value)
            })
        }
        return (components.url)!
    }
    
    public var defaultQyeryParams: [String : String]? {
        let queryParams = ["api_key" : "DEMO_KEY"]
        return queryParams
    }
    
    public var queryParams: [String : String]? { defaultQyeryParams }
}

struct ApodAPIDataModel: APIDataModel{
    
    typealias DataModelType = ApodDataDto
    
    var path: String
    var date: String
    
    public var queryParams: [String : String]? {
        var newQueryParams = defaultQyeryParams
        newQueryParams?["date"] = date
        return newQueryParams
    }
    
    init(with date: String){
        self.path = NasaServicePath.apod.rawValue
        self.date = date
    }
}
