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
    @State private var searchQuery: String = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: SearchBar(text: self.$searchQuery)
                        .padding([.top, .bottom])) {
                        ForEach(self.viewModel.hospitals.filter { (hospital) -> Bool in
                            // search query filter
                            self.searchQuery.isEmpty ? true : hospital.OrganisationName.contains(self.searchQuery)
                        }, id: \.OrganisationID) { hospital in

                            NavigationLink(destination: HospitalDetailView(model: hospital)) {
                                // hospital cell view
                                HospitalCellListView(model: hospital)
                            }
                        }
                    }
                }.id(UUID())
            }.onAppear {
                self.viewModel.loadHospitals()
            }

            .navigationBarTitle("Hospitals in the UK")
        }
    }
}

struct HospitalListView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalListView(viewModel: HospitalListViewModel(dataStore: HospitalsDataStore(),
                                                          /// provide sample data for our preview
                                                          hospitals: Hospital.allSamples()))
    }
}
