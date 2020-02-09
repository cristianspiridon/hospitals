//
//  ModelResponse.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation

struct Hospital: Decodable {
    let OrganisationID: Int
    let OrganisationCode: String
    let OrganisationType: String
    let SubType: String
    let Sector: String
    let OrganisationStatus: String
    let IsPimsManaged: String
    let OrganisationName: String
    let Address1: String
    let Address2: String
    let Address3: String
    let City: String
    let County: String
    let Postcode: String
    let Latitude: String
    let Longitude: String
    let ParentODSCode: String
    let ParentName: String
    let Phone: String
    let Email: String
    let Website: String
    let Fax: String
}
