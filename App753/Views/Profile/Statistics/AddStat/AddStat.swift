//
//  AddStat.swift
//  App753
//
//  Created by IGOR on 05/08/2024.
//

import SwiftUI

struct AddStat: View {
    
    @StateObject var viewModel: StatisticsViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.stName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.stName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    
                    HStack {
                        
                        Image(systemName: "calendar")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 17, weight: .regular))
                        
                        DatePicker("", selection: $viewModel.stDate, displayedComponents: .date)
                            .labelsHidden()
                        
                        Spacer()
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Time")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.stTime.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.stTime)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Jumps")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.stJumps.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.stJumps)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Spins")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.stSpins.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.stSpins)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Step Sequences")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.stSec.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.stSec)
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    .padding(.bottom)
                    
                    Text("Event type")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        ForEach(viewModel.types, id: \.self) { index in
                        
                            HStack {
                                
                                Button(action: {
                                    
                                    viewModel.currentType = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .stroke(.gray)
                                                .frame(width: 20)
                                                .opacity(viewModel.currentType == index ? 0 : 1)
                                         
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .regular))
                                                .padding()
                                                .background(Circle().fill(Color("prim")).frame(width: 20))
                                                .opacity(viewModel.currentType == index ? 1 : 0)
                                        }
                                        
                                        Text(index)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                })
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim").opacity(viewModel.currentType == index ? 1 : 0)))
                                .padding(1)
                            }
                        }
                    }
                }
                .padding(.top, 20)
                
                Button(action: {
                    
                    if viewModel.currentType == "Training" {
                        
                        viewModel.tr += 1
                        
                    } else {
                        
                        viewModel.per += 1
                    }
                    
                    viewModel.stType = viewModel.currentType
                    
                    viewModel.addStatistic()
                    
                    viewModel.stName = ""
                    viewModel.stTime = ""
                    viewModel.currentType = ""
                    viewModel.stJumps = ""
                    viewModel.stSpins = ""
                    viewModel.stSec = ""
                    
                    viewModel.fetchStatistics()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("SAVE")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .opacity(viewModel.stName.isEmpty || viewModel.stJumps.isEmpty || viewModel.stTime.isEmpty || viewModel.stSpins.isEmpty || viewModel.stSec.isEmpty ? 0.5 : 1)
                .disabled(viewModel.stName.isEmpty || viewModel.stJumps.isEmpty || viewModel.stTime.isEmpty || viewModel.stSpins.isEmpty || viewModel.stSec.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddStat(viewModel: StatisticsViewModel())
}
