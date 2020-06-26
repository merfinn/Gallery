//
//  AutoModelListViewModel.swift
//  Gallery
//
//  Created by merve kavaklioglu on 21.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import SwiftUI
import Combine

final class AutoModelListViewModel:ObservableObject {
    
    var autoModelHandler: AutoModelHandler
    var manufacturerId: String?
    
    @Published var autoModels = Array<(key:String,value:String)>()
    
    var disposables: Set<AnyCancellable> = []
    
    private var hasAutoModels: AnyPublisher<Array<(key:String,value:String)>, Never> {
        autoModelHandler.$autoModelResponse
            .receive(on: RunLoop.main)
            .map { [weak self] response in
                guard let response = response else {
                    return Array()
                }
                let sortedWkda = response.wkda.sorted { (aDic, bDic) -> Bool in
                    return aDic.value.caseInsensitiveCompare(bDic.value)  == .orderedAscending
                }
                self?.autoModels.append(contentsOf: sortedWkda)
                return self?.autoModels ?? Array()
        }
        .eraseToAnyPublisher()
    }
    
    init(request: AutoModelHandler = AutoModelHandler()) {
        self.autoModelHandler = request
        
        hasAutoModels
            .receive(on: RunLoop.main)
            .assign(to: \.autoModels, on: self)
            .store(in: &disposables)
    }
    
    func dispose() {
        disposables.first?.cancel()
    }
    
    func decideToLoadMore(itemIndex:Int) {
        if autoModels.count-1 == itemIndex { // Last item
            if shouldLoadMore(){
                getAutoModels(manufacturerId: manufacturerId ?? "")
            }
        }
    }
    
    func getAutoModels(manufacturerId: String) {
        self.manufacturerId = manufacturerId
        autoModelHandler.getAutoModels(manufacturer: manufacturerId)
    }
    
    func shouldLoadMore() -> Bool {
        return autoModelHandler.shouldLoadMore()
    }
    
    func colorForIndex(itemIndex:Int) -> Color {
        return (itemIndex  % 2 == 0) ? Color(.systemBlue) : Color(.white)
    }
}
