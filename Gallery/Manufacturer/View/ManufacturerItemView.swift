//
//  ManufacturerItemView.swift
//  Gallery
//
//  Created by merve kavaklioglu on 19.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import SwiftUI

struct ManufacturerItemView: View {
    var item: (key:String,value:String)
    var body: some View {
        NavigationLink(destination: AutoModelView(manufacturer: item)) {
            HStack {
                Text(item.value)
                Spacer()
            }
            .frame(height: 60)
        }
    }
}

struct ManufacturerItemView_Previews: PreviewProvider {
    static var previews: some View {
        ManufacturerItemView(item: (key: "1", value: "A"))
    }
}
