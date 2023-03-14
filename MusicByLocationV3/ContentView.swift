//
//  ContentView.swift
//  MusicByLocationV3
//
//  Created by Perkins, Alexander (ABH) on 13/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    
    var body: some View {
            VStack {
                Image(systemName: "location.north")
                List {
                    if state.artistsByLocation.count > 3 {
                        Text(state.artistsByLocation[0])
                        Text(state.artistsByLocation[1])
                        Text(state.artistsByLocation[2])
                    }
                }
                Button("Find Music ", action: {
                    state.findMusic()
                })
                    .buttonStyle(.bordered)
            }.onAppear(perform:{
                state.requestAccessToLocationData()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
