//
//  DataBaseView.swift
//  App753
//
//  Created by IGOR on 05/08/2024.
//

import SwiftUI

struct DataBaseView: View {

    @StateObject var viewModel = DatabaseViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Element Database")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.curType = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.curType == index ? .black : .gray)
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 28)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(viewModel.curType == index ? 1 : 0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 30)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                .padding(.bottom)
                
                if viewModel.curType == "All" {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Text("Jumps")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(viewModel.databases.filter{$0.type == "Jumps"}, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(index.name)
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text(index.descr)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                        }
                        
                        Text("Spins")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(viewModel.databases.filter{$0.type == "Spins"}, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(index.name)
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text(index.descr)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                        }
                        
                        Text("Step Sequences")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(viewModel.databases.filter{$0.type == "Step Sequences"}, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(index.name)
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Text(index.descr)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                        }
                    }
                }
                
            } else {
                
                VStack {
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(Color(.black))
                        .font(.system(size: 13, weight: .regular))
                        .padding(7)
                        .background(Circle().fill(Color("prim")))
                    
                    Text("This section is currently empty. Select mastered elements from the list and they will appear here.")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg")))
                
                Spacer()
            }
            }
            .padding()
        }
    }
}

#Preview {
    DataBaseView()
}
