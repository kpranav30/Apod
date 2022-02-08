//
//  NetworkRequest.swift
//  Apod
//
//  Created by Pranav Kulkarni on 2/7/22.
//

import Foundation

public protocol NetworkRequest: AnyObject {
    associatedtype DataModelType
    func decode(_ data: Data) -> DataModelType?
    func execute(withCompletionHandler completionHandler: @escaping (DataModelType?) -> Void)
}

extension NetworkRequest {
    
    func load(_ url:URL, withCompletionHandler completionHandler: @escaping (DataModelType?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) -> Void in
            guard let data = data, let decodedData = self?.decode(data) else{
                DispatchQueue.main.async {
                    print(error?.localizedDescription ?? "error")
                    print(response ?? "response")
                    completionHandler(nil)
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(decodedData)
            }
        }
        dataTask.resume()
    }
}

// To fetch various remote resources
class APIDataRequest<Model: APIDataModel> {
    
    let dataModel: Model
    
    init(dataModel: Model){
        self.dataModel = dataModel
    }
}

extension APIDataRequest: NetworkRequest {
    typealias DataModelType = ApodDataDto
    
    func decode(_ data: Data) -> ApodDataDto? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let decodedModel = try? decoder.decode(ApodDataDto.self, from: data)
        return decodedModel
    }
    
    func execute(withCompletionHandler completionHandler: @escaping (DataModelType?) -> Void) {
        load(dataModel.url, withCompletionHandler: completionHandler)
    }
}
