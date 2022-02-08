//
//  ApodDataDto.swift
//  Apod
//
//  Created by Pranav Kulkarni on 2/7/22.
//

import Foundation


public struct ApodDataDto: Decodable{
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case explanation = "explanation"
        case hdUrl = "hdurl"
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title = "title"
        case url = "url"
    }

    public let date: String
    public let explanation: String
    public let hdUrl : String?
    public let mediaType: String
    public let serviceVersion: String
    public let title: String
    public let url: String
    
}
