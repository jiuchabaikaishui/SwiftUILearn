//
//  ContentView.swift
//  SwiftUILearn
//
//  Created by QSP on 2022/10/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            CircleImage().offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    .foregroundStyle(.background)
                    
                HStack {
                    Text("Joshua Tree Nation Park")
                        .font(.subheadline)
                        
                    Spacer()
                    
                    Text("California")
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
