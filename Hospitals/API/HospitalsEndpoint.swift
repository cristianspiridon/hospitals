//
//  HospitalsEndpoint.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

enum Endpoint {
    case hospitals

    var baseURL: URL {
        return URL(string: "http://media.nhschoices.nhs.uk/")!
    }

    var path: String {
        switch self {
        case .hospitals:
            return "data/foi/Hospital.csv"
        }
    }
}
