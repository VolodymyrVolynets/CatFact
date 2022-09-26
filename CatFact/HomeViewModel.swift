//
//  HomeViewModel.swift
//  CatFact
//
//  Created by Vova on 26/09/2022.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var catFact: CatFactModel?
    @AppStorage("numOfFactsDownloaded") var numOfFactsDownloaded = 0
    let catFactModel = CatFactmanager()
    var cancelable: AnyCancellable?
    
    init() {
        subsctibeFact()
        downloadFact()
    }
    
    func subsctibeFact() {
        cancelable = catFactModel.$catFact
            .sink { fact in
                self.catFact = fact
                self.factWasDownloaded()
            }
            
    }
    
    func downloadFact() {
        catFactModel.downloadFact()
    }
    
    private func factWasDownloaded() {
        numOfFactsDownloaded += 1
    }
}
