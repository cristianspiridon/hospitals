//
//  HospitalListViewModel.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

class HospitalListViewModel: ObservableObject {
    @Published var hospitals: [Hospital]
    private let dataStore: HospitalsDataStore

    init(dataStore: HospitalsDataStore) {
        self.dataStore = dataStore
        hospitals = []
    }

    func loadHospitals() {
        dataStore.loadHospitals { [weak self] result in
            print("Load hospitals")
            switch result {
            case let .success(hospitals):
                self?.hospitals = hospitals
            case let .failure(error):
                print("Ops we have an error \(error.localizedDescription)")
            }
        }
    }
}
