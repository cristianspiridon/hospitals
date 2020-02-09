//
//  ContentView.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let viewModel = HospitalListViewModel(dataStore: HospitalsDataStore())

    var body: some View {
        HospitalListView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
