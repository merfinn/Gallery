//
//  ManufacturerListViewModel.swift
//  Gallery
//
//  Created by merve kavaklioglu on 17.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import SwiftUI
import Combine

final class ManufacturerListViewModel:ObservableObject {
    var manufacturerHandler: ManufacturerHandler
    @Published var manufacturers = Array<(key:String,value:String)>()
    private var disposables: Set<AnyCancellable> = []
    var hasManufacturers: AnyPublisher<Array<(key:String,value:String)>, Never> {
        manufacturerHandler.$manufacturerResponse
            .receive(on: RunLoop.main)
            .map { [weak self] response in
                guard let response = response else {
                    return Array()
                }
                let sortedWkda = response.wkda.sorted { (aDic, bDic) -> Bool in
                    return aDic.value.caseInsensitiveCompare(bDic.value)  == .orderedAscending
                }
                self?.manufacturers.append(contentsOf: sortedWkda)
                return self?.manufacturers ?? Array()
        }
        .eraseToAnyPublisher()
    }
    
    init(request: ManufacturerHandler = ManufacturerHandler()) {
        
        self.manufacturerHandler = request
        
        hasManufacturers
            .receive(on: RunLoop.main)
            .assign(to: \.manufacturers, on: self)
            .store(in: &disposables)
        
        getManufacturers()
    }
        
    func colorForIndex(itemIndex:Int) -> Color {
        return (itemIndex  % 2 == 0) ? Color(.systemPink) : Color(.white)
    }
    
    func decideToLoadMore(itemIndex:Int) {
        if manufacturers.count-1 == itemIndex { // Last item
            if shouldLoadMore(){
                getManufacturers()
            }
        }
    }
    func getManufacturers() {
        manufacturerHandler.getManufacturers()
    }
    func shouldLoadMore() -> Bool {
        return manufacturerHandler.shouldLoadMore()
    }
}
