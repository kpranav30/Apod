//
//  ApodDetails.swift
//  Apod
//
//  Created by Pranav Kulkarni on 2/7/22.
//

import Foundation

public enum MediaType{
    case image
    case video
}

public struct ApodDetails{
    public let date: String
    public let explanation: String
    public let mediaType: MediaType
    public let title: String
    public let url: String
    public let hdUrl: String?
    
    init(with apodDto: ApodDataDto){
        self.date = apodDto.date
        self.explanation = apodDto.explanation
        self.mediaType = apodDto.mediaType == "image" ? .image : .video
        self.title = apodDto.title
        self.url = apodDto.url
        self.hdUrl = apodDto.hdUrl
    }
}
