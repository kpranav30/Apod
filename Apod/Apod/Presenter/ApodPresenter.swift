//
//  ApodPresenter.swift
//  Apod
//
//  Created by Pranav Kulkarni on 2/7/22.
//

import Foundation

protocol ApodPresenter {
    func apodForDate(date: Date)
    func formattedDate(date: Date) -> String
}

protocol ApodPresenterDelegate: AnyObject {
    func receivedApodDetails(apod: Apod)
    func didNotReceiveApodDetails()
}

public class ApodPresenterImplementation:ApodPresenter{
    
    var dataProvider:DataProvider?
    weak var delegate: ApodPresenterDelegate?
    private var apodDetail: ApodDetails?
    
    init(delegate: ApodPresenterDelegate){
        self.delegate = delegate
        dataProvider = DataProviderImplementation(with: self)
    }
    
    func apodForDate(date: Date) {
        dataProvider!.fetchApod(for: formattedDate(date: date))
    }
    
    func formattedDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
}

extension ApodPresenterImplementation:DataProviderDelegate {
    
    func apodDetailsReceived(apod: ApodDetails) {
        self.apodDetail = apod
        self.delegate?.receivedApodDetails(apod: Apod(with: apod))
    }
    
    func failedToLoadApodData() {
        self.delegate?.didNotReceiveApodDetails()
    }
}
