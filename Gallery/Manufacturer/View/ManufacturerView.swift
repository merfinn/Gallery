//
//  ManufacturerView.swift
//  Gallery
//
//  Created by merve kavaklioglu on 19.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import SwiftUI

struct ManufacturerView: View {
    
    var body: some View {
        NavigationView{
            ManufacturerListView()
            .navigationBarTitle("Manufacturers")
        }
    }
}

struct ManufacturerView_Previews: PreviewProvider {
    static var previews: some View {
        ManufacturerView()
    }
}
