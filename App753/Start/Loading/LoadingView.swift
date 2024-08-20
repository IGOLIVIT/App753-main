//
//  LoadingView.swift
//  App753
//
//  Created by IGOR on 04/08/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoadingView()
}
