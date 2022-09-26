//
//  CatFactManager.swift
//  CatFact
//
//  Created by Vova on 26/09/2022.
//

import Foundation
import Combine

class CatFactmanager: ObservableObject {
    
    @Published var catFact: CatFactModel?
    var cancelable: AnyCancellable?
    
    init() {
    }
    
    func downloadFact() {
        guard let url = URL(string: "https://catfact.ninja/fact") else { return }
        cancelable = NetworkManager.shared.downloadData(url: url)
            .decode(type: CatFactModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.shared.handleCompletion, receiveValue: { [weak self] model in
                self?.catFact = model
                self?.cancelable?.cancel()
            })
    }
}
