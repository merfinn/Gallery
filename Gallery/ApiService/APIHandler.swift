//
//  APIHandler.swift
//  Gallery
//
//  Created by merve kavaklioglu on 17.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import Alamofire
import Combine

class APIHandler {
    
    var statusCode = Int.zero
    var pageStatus = PageStatus.ready(nextPage: 0)
    let pageSize = 15
    let api = "http://api-aws-eu-qa-1.auto1-test.com/"
    let wa_key = "coding-puzzle-client-449cc9d"
    
    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            return response.value
        case .failure:
            return nil
        }
    }
        
    func shouldLoadMore() -> Bool {
        guard case .done = pageStatus else {
            return true
        }
        return false
    }
    
    func updatePageEndLoadingStatus (currentPage:Int, lastPage:Int) {
        if currentPage+1 == lastPage {
            self.pageStatus = .done
        }
        else {
            self.pageStatus = .ready(nextPage: currentPage + 1)
        }
    }
    
    enum PageStatus {
        case ready (nextPage: Int)
        case loading (page: Int)
        case done
    }
}
