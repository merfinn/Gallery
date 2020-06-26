//
//  ManufacturerListView.swift
//  Gallery
//
//  Created by merve kavaklioglu on 19.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import SwiftUI

struct ManufacturerListView: View {
    @ObservedObject var viewModel = ManufacturerListViewModel()
    var body: some View {
        
        List{
            ForEach(viewModel.manufacturers.indices, id: \.self){ index in
                ManufacturerItemView(item: self.viewModel.manufacturers[index])
                    .listRowBackground(self.viewModel.colorForIndex(itemIndex: index))
                    .onAppear(perform: {
                        self.viewModel.decideToLoadMore(itemIndex: index)
                    })
            }
        }
    }
}

struct ManufacturerListView_Previews: PreviewProvider {
    static var previews: some View {
        ManufacturerListView()
    }
}
