//
//  HospitalsDataStore.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

typealias HospitalResponse = (Result<[Hospital], NetworkError>) -> Void

final class HospitalsDataStore {
    private let network: Network
    private var allHospitals: [Hospital]

    init(network: Network = Network()) {
        self.network = network
        allHospitals = []
    }

    func loadHospitals(completion: @escaping HospitalResponse) {
        network.fetchHospitalsFromCloud { [weak self] result in
            guard self != nil else {
                completion(.failure(.unknown(nil)))
                return
            }

            if case let Result.success(hospitals) = result {
                self?.allHospitals = hospitals
                completion(.success(hospitals))
            }
        }
    }
}

private extension Network {
    func fetchHospitalsFromCloud(completion: @escaping HospitalResponse) {
        fetchCSVModel(endpoint: .hospitals, completion: completion)
    }
}
