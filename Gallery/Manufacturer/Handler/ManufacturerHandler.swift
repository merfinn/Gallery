//
//  ManufacturerRequest.swift
//  Gallery
//
//  Created by merve kavaklioglu on 17.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import Combine
import Alamofire

class ManufacturerHandler: APIHandler {
    
    @Published var manufacturerResponse: ResponseObject?

    func getManufacturers() {
        
        guard case let .ready(page) = pageStatus else {
            return
        }
        pageStatus = .loading(page: page)
        
        let ws = "v1/car-types/manufacturer"
        let param = ["page": page, "pageSize": pageSize, "wa_key": wa_key] as [String : Any]
        
        
        AF.request(api+ws, method: .get,parameters: param).responseDecodable { [weak self] (response: DataResponse<ResponseObject, AFError>) in
                        
            guard let weakSelf = self else {
                return
            }
            
            guard let response = weakSelf.handleResponse(response) as? ResponseObject else {
                return
            }
            
            weakSelf.updatePageEndLoadingStatus(currentPage: response.page ?? 0, lastPage: response.totalPageCount ?? 0 )
            weakSelf.manufacturerResponse = response
        }
    }
}
