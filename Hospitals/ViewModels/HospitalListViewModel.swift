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

    init(dataStore: HospitalsDataStore, hospitals: [Hospital] = []) {
        self.dataStore = dataStore
        self.hospitals = hospitals
    }

    func loadHospitals() {
        dataStore.loadHospitals { [weak self] result in
            switch result {
            case let .success(hospitals):
                DispatchQueue.main.async {
                    self?.hospitals = hospitals
                }
            case let .failure(error):
                print("Ops we have an error \(error.localizedDescription)")
            }
        }
    }
}
