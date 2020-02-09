//
//  HospitalListView.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct HospitalListView: View {
    @ObservedObject var viewModel: HospitalListViewModel

    var body: some View {
        VStack {
            List {
                ForEach(self.viewModel.hospitals, id: \.OrganisationID) { hospital in
                    Text("Hospital \(hospital.OrganisationName)")
                }
            }
        }.onAppear {
            self.viewModel.loadHospitals()
        }
    }
}

struct HospitalListView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalListView(viewModel: HospitalListViewModel(dataStore: HospitalsDataStore()))
    }
}
