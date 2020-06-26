//
//  AutoModelListView.swift
//  Gallery
//
//  Created by merve kavaklioglu on 21.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import SwiftUI

struct AutoModelListView: View {
    @ObservedObject var viewModel = AutoModelListViewModel()
    @State private var showingAlert = false
    @State private var item = "" // track last clicked item
    
    var manufacturer: (key:String,value:String)
    var body: some View {
        List{
            ForEach(self.viewModel.autoModels.indices, id: \.self) { index in
                Button(action: {
                    self.item = self.viewModel.autoModels[index].key
                    self.showingAlert = true }) {
                    AutoModelListItemView(item: self.viewModel.autoModels[index])
                }
                .listRowBackground(self.viewModel.colorForIndex(itemIndex: index))
                .onAppear(perform: {
                    self.viewModel.decideToLoadMore(itemIndex: index)
                })
            }
        }
        .alert(isPresented: self.$showingAlert) {
            Alert(title: Text("Your Selection"), message:Text("Your selection is: \(manufacturer.value) - \(item)"), dismissButton: .default(Text("Ok")))
        }
        .onAppear {
            self.viewModel.getAutoModels(manufacturerId: self.manufacturer.key)
        }
        .onDisappear(
            perform: self.viewModel.dispose
        )
    }
}

struct AutoModelListView_Previews: PreviewProvider {
    static var previews: some View {
        AutoModelListView(manufacturer: (key: "01", value: "Audi"))
    }
}
