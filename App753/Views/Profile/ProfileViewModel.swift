//
//  ProfileViewModel.swift
//  App753
//
//  Created by IGOR on 04/08/2024.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @Published var photos: [String] = ["g1"]
    
    @Published var currentPhoto = ""
    @Published var addName = ""
    @Published var addAge = ""
    @Published var addExperience = ""
    @Published var addSkil = ""

    @AppStorage("userPhoto") var userPhoto = ""
    @AppStorage("userName") var userName = ""
    @AppStorage("age") var age = ""
    @AppStorage("experience") var experience = ""
    @AppStorage("skil") var skill = ""
    
    @Published var addReward = ""
    @AppStorage("records") var records: [String] = []

    @Published var isAddRew: Bool = false

    @Published var isEditProfile: Bool = false
}
