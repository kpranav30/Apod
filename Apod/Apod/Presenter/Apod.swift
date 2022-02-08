//
//  Apod.swift
//  Apod
//
//  Created by Pranav Kulkarni on 2/8/22.
//

import Foundation

public struct Apod{
    public let date: String
    public let explanation: String
    public let title: String
    public let url: URLRequest?
    public let hdUrl: String?
    
    init(with apodDetail: ApodDetails){
        self.date = apodDetail.date
        self.explanation = apodDetail.explanation
        self.title = apodDetail.title
        if let url = URL(string: apodDetail.url){
            self.url = URLRequest(url: url)
        }else{
            self.url = nil
        }
        self.hdUrl = apodDetail.hdUrl
    }
}
