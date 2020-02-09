//
//  Network.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import CSV
import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decoding(Error)
    case unknown(Error?)
    case parsingError(String)
}

final class Network {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchCSVModel<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<
        [T], NetworkError
    >) -> Void) {
        guard let url = URL(string: endpoint.path, relativeTo: endpoint.baseURL) else {
            completion(.failure(.badURL))
            return
        }
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }

            guard let csvData = data else {
                completion(.failure(.noData))
                return
            }

            let strData = String(decoding: csvData, as: UTF8.self)
            do {
                var records = [T]()
                let reader = try CSVReader(string: strData, delimiter: "�")
                reader.next()

                while let row = reader.next() {
                    /// obviouly a decoder would be better solution, one that will also read the header csv, so a CSVRowDecoder would be good, but not enought time now.
                    /// force type casting is not a good approach here
                    /// normally we work with json responses from webservers, and decoding json is pretty easy using the JSONDecoder

                    let record: T = Hospital(OrganisationID: Int(row[0])!,
                                             OrganisationCode: row[1],
                                             OrganisationType: row[2],
                                             SubType: row[3],
                                             Sector: row[4],
                                             OrganisationStatus: row[5],
                                             IsPimsManaged: row[6],
                                             OrganisationName: row[7],
                                             Address1: row[8],
                                             Address2: row[9],
                                             Address3: row[10],
                                             City: row[11],
                                             County: row[12],
                                             Postcode: row[13],
                                             Latitude: row[14],
                                             Longitude: row[15],
                                             ParentODSCode: row[16],
                                             ParentName: row[17],
                                             Phone: row[18],
                                             Email: row[19],
                                             Website: row[20],
                                             Fax: row[21]) as! T
                    records.append(record)
                }

                completion(.success(records))

            } catch {
                print("error ", error)
                completion(.failure(.decoding(error)))
            }
        }.resume()
    }
}
