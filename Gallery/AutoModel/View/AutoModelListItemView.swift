//
//  AutoModelListItemView.swift
//  Gallery
//
//  Created by merve kavaklioglu on 21.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import SwiftUI

struct AutoModelListItemView: View {
    var item: (key:String,value:String)
    var body: some View {
        HStack {
            Text(item.value)
            Spacer()
        }
        .frame(height: 60)
    }
}

struct AutoModelListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AutoModelListItemView(item: (key: "1", value: "A"))
    }
}
