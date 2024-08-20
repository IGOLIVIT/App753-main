//
//  StatisticsView.swift
//  App753
//
//  Created by IGOR on 05/08/2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Skating statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            
                            Text("Training")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .medium))
                            
                            Spacer()

                        }
                        
                        HStack {
                            
                            Image(systemName: "figure.run.square.stack.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("\(viewModel.tr)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .bold))
                            
                            Spacer()
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.1)))

                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            
                            Text("Performances")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .medium))
                            
                            Spacer()
 
                        }
                        
                        HStack {
                            
                            Image(systemName: "medal.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("\(viewModel.per)")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .bold))
                            
                            Spacer()
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.1)))
                }
                
                if viewModel.statistics.isEmpty {
                    
                    VStack {
                        
                        Text("The list is empty, add the first training or performance")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("+ Add")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .regular))
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.1)))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.statistics, id: \.self) { index in
                            
                                VStack(spacing: 9) {
                                    
                                    HStack {
                                        
                                        if index.stType == "Training" {
                                            
                                            Image(systemName: "figure.run.square.stack.fill")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 15, weight: .regular))
                                            
                                        } else {
                                            
                                            Image(systemName: "medal.fill")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                        
                                        Text("\((index.stDate ?? Date()).convertDate(format: "dd.MM.YYYY"))")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedStatistic = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDelete = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "trash")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .regular))
                                                .padding(5)
                                                .background(Circle().fill(.white))
                                        })
                                    }
                                    
                                    HStack {
                                        
                                        Text(index.stName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Image(systemName: "timer")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text("\(index.stTime ?? "") min")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                    }
                                    
                                    Rectangle()
                                        .fill(.gray)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                    
                                    HStack {
                                        
                                        Text("Jumps:")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.stJumps ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .semibold))
                                    }
                                    
                                    HStack {
                                        
                                        Text("Spins:")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.stSpins ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .semibold))
                                    }
                                    
                                    HStack {
                                        
                                        Text("Step Sequences:")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text(index.stSec ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .semibold))
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.1)))
                            }
                            
                        }
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .medium))
                        .padding(16)
                        .background(Circle().fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .opacity(viewModel.statistics.isEmpty ? 0 : 1)
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteStat(withStName: viewModel.selectedStatistic?.stName ?? "", completion: {
                            
                            viewModel.fetchStatistics()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchStatistics()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddStat(viewModel: viewModel)
        })
    }
}

#Preview {
    StatisticsView()
}
