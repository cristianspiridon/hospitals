//
//  HospitalCellListView.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import SwiftUI

struct HospitalCellListView: View {
    let model: Hospital

    var body: some View {
        VStack(alignment: .leading) {
            Text(model.OrganisationName)
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
                .padding()

            Text("\(model.City), \(model.County), \(model.Postcode)")
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
                .padding([.leading])

            if !model.Phone.isEmpty {
                HStack {
                    Image("call")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(model.Phone)
                        .padding()
                }.padding([.leading])
            }
        }
    }
}

struct HospitalCellListView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalCellListView(model: Hospital.sample()).previewLayout(.sizeThatFits)
    }
}
