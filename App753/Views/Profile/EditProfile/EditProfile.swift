//
//  EditProfile.swift
//  App753
//
//  Created by IGOR on 05/08/2024.
//

import SwiftUI

struct EditProfile: View {

    @StateObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {

                ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    Menu(content: {
                        
                        ForEach(viewModel.photos, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentPhoto = index
                                
                            }, label: {
                                
                                Image(index)
                            })
                            
                        }
                        
                    }, label: {
                        
                        if viewModel.currentPhoto.isEmpty {
                            
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
                        
                    })
                    .padding(.top, 30)
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    VStack(spacing: 10) {

                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))

                        ZStack(alignment: .leading, content: {
                            
                            Text("Type of skiling")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addSkil.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addSkil)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))

                        ZStack(alignment: .leading, content: {
                            
                            Text("Age")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addAge.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addAge)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))

                        ZStack(alignment: .leading, content: {
                            
                            Text("Experience")
                                .foregroundColor(.white.opacity(0.3))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.addExperience.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.addExperience)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                        .padding(.bottom)

                    }
                    .padding(.top)
                }
                
                Button(action: {
                    
                    viewModel.userPhoto = viewModel.currentPhoto
                    viewModel.userName = viewModel.addName
                    viewModel.age = viewModel.addAge
                    viewModel.skill = viewModel.addSkil
                    viewModel.experience = viewModel.addExperience
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEditProfile = false
                    }
                    
                }, label: {
                    
                    Text("SAVE")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    EditProfile(viewModel: ProfileViewModel())
}
