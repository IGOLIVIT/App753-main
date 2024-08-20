//
//  ProfileView.swift
//  App753
//
//  Created by IGOR on 04/08/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditProfile = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        if viewModel.userPhoto.isEmpty {
                            
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("bg"))
                                .font(.system(size: 90))
                                .background(Circle().fill(.black))
                            
                        } else {
                            
                            Image(viewModel.currentPhoto)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                        }
                        
                        if viewModel.userName.isEmpty {
                            
                            Text("Username")
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .bold))
                            
                            Text("Type of skiling")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .semibold))
                            
                        } else {
                            
                            Text(viewModel.userName)
                                .foregroundColor(.white)
                                .font(.system(size: 22, weight: .bold))
                            
                            Text(viewModel.skill)
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .semibold))
                        }
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                HStack {
                                    
                                    Text("Age")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 15, weight: .regular))
                                }
                                
                                Text(viewModel.age)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                HStack {
                                    
                                    Text("Experience")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "clock")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 15, weight: .regular))
                                }
                                
                                Text(viewModel.experience)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.05)))
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                    
                    VStack {
                        
                        Text("Rewards")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom)
                        
                        ForEach(viewModel.records, id: \.self) { index in
                        
                            VStack(spacing: 7) {
                                
                                HStack {
                                    
                                    Image(systemName: "medal.fill")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 17, weight: .regular))
                                    
                                    Text(index)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                }
                                
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white.opacity(0.05)))
                        }
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddRew = true
                            }
                            
                        }, label: {
                            
                            Text("+ Add reward")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 15, weight: .medium))
                                .padding(8)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                        })
                        .padding(.top, 20)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddRew ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddRew = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddRew = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Add reward")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter the name of the award")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addReward.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addReward)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    
                    HStack {
                        
                        Button(action: {
                            
                            
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddRew = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.records.append(viewModel.addReward)
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddRew = false
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isAddRew ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isEditProfile, content: {
            
            EditProfile(viewModel: viewModel)
        })
    }
}

#Preview {
    ProfileView()
}
