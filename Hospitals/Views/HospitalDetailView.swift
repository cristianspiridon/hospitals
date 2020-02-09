//
//  HospitalDetailView.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import MapKit
import SwiftUI
import UIKit

struct HospitalDetailView: View {
    let model: Hospital

    var body: some View {
        VStack {
            MapView(centerCoordinate: model.coordinates())
            HospitalCellListView(model: model)
                .padding([.bottom], 65)
        }
        .navigationBarTitle("Hospital Details")
    }
}

struct HospitalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalDetailView(model: Hospital.sample())
    }
}
