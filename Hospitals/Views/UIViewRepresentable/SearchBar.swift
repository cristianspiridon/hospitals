//
//  SearchBar.swift
//  Hospitals
//
//  Created by The Spiridon's on 09/02/2020.
//  Copyright © 2020 The Spiridon's. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

// Port UISearchBar to SwiftUI.
// More about this can be found in the excellent WWDC 2019 talk - Integrating SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            text = searchBar.text ?? ""
        }

        func searchBarCancelButtonClicked(_: UISearchBar) {
            text = ""
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.showsCancelButton = true
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar,
                      context _: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
