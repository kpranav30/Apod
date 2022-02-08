//
//  DataProvider.swift
//  Apod
//
//  Created by Pranav Kulkarni on 2/7/22.
//

import Foundation

enum APIConstants: String {
    case baseUrl = "https://api.nasa.gov"
}

enum NasaServicePath: String {
    case apod = "/planetary/apod"
}

protocol DataProvider {
    func fetchApod(for date: String)
}

protocol DataProviderDelegate: AnyObject {
    func apodDetailsReceived(apod: ApodDetails)
    func failedToLoadApodData()
}

class DataProviderImplementation: DataProvider {
    weak var delegate: DataProviderDelegate?
    private var dataModel: ApodAPIDataModel?
    private var request: APIDataRequest<ApodAPIDataModel>?
    
    func fetchApod(for date: String) {
        dataModel = ApodAPIDataModel(with: date)
        request = APIDataRequest(dataModel: self.dataModel!)
        request!.execute { [weak self] aPodData in
            if let aPodData = aPodData {
                self?.delegate?.apodDetailsReceived(apod: ApodDetails(with: aPodData))
            }else{
                self?.delegate?.failedToLoadApodData()
            }
        }
    }
    
    init(with delegate:DataProviderDelegate){
        self.delegate = delegate
    }
}
