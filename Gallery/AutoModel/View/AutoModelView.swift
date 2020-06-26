//
//  AutoModelView.swift
//  Gallery
//
//  Created by merve kavaklioglu on 21.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import SwiftUI

struct AutoModelView: View {
    var manufacturer: (key:String,value:String)
    
    var body: some View {
        AutoModelListView(manufacturer: manufacturer)
            .navigationBarTitle("Models")
    }
}

struct AutoModelView_Previews: PreviewProvider {
    static var previews: some View {
        AutoModelView(manufacturer: (key: "01", value: "Audi"))
    }
}
