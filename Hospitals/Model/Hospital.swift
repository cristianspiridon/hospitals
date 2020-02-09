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
    let Address1: String?
    let Address2: String?
    let Address3: String?
    let City: String
    let County: String
    let Postcode: String
    let Latitude: String
    let Longitude: String
    let ParentODSCode: String?
    let ParentName: String?
    let Phone: String
    let Email: String?
    let Website: String?
    let Fax: String?
}

extension Hospital {
    static func sample() -> Hospital {
        return Hospital(OrganisationID: 17970,
                        OrganisationCode: "NDA07",
                        OrganisationType: "Hospital",
                        SubType: "Hospital",
                        Sector: "Independent Sector",
                        OrganisationStatus: "Visible",
                        IsPimsManaged: "true",
                        OrganisationName: "Walton Community Hospital - Virgin Care Services Ltd",
                        Address1: nil,
                        Address2: "Rodney Road",
                        Address3: nil,
                        City: "Walton-on-Thames",
                        County: "Surrey",
                        Postcode: "KT12 3LD",
                        Latitude: "51.379997253417969",
                        Longitude: "-0.40604206919670105",
                        ParentODSCode: "NDA",
                        ParentName: "Virgin Care Services Ltd",
                        Phone: "01932 414205",
                        Email: nil,
                        Website: nil,
                        Fax: "01932 253674")
    }

    static func allSamples() -> [Hospital] {
        return [sample(),
                sample(),
                sample(),
                sample()]
    }
}
