//
//  ResponseObject.swift
//  Gallery
//
//  Created by merve kavaklioglu on 17.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import Foundation

/**
 * Lightweight model structure for a ResponseObject ready for coding and decoding
 */

struct ResponseObject: Codable {
    
    let page: Int?
    let pageSize: Int?
    let totalPageCount: Int?
    let wkda: [String:String]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case pageSize
        case totalPageCount
        case wkda
    }
}
