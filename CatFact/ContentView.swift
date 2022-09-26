//
//  ContentView.swift
//  CatFact
//
//  Created by Vova on 26/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Facts downloaded: \(vm.numOfFactsDownloaded)")
            Text(vm.catFact?.fact ?? "")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                
            Spacer(minLength: 0)
            
            Button {
                vm.downloadFact()
            } label: {
                Text("New Fact")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(7)
                    .padding(.horizontal, 5)
                    .background {
                        Color.blue
                            .cornerRadius(13)
                    }
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
