//
//  DatabaseViewModel.swift
//  App753
//
//  Created by IGOR on 05/08/2024.
//

import SwiftUI

final class DatabaseViewModel: ObservableObject {
    
    @Published var types: [String] = ["All", "Completed"]
    @Published var curType = "All"
    
    @Published var databases: [DatabaseModel] = [
        
        DatabaseModel(id: 1, type: "Jumps", name: "Axel", descr: "a jump from one edge to the other with s couner-clockwise rotation"),
        DatabaseModel(id: 1, type: "Jumps", name: "Toe Loop", descr: "a jump from one edge to the other with a clockwise rotation"),
        DatabaseModel(id: 1, type: "Jumps", name: "Salchow", descr: "a jump from one edge to the other with a counter-clockwise rotation"),
        DatabaseModel(id: 1, type: "Jumps", name: "Loop", descr: "a jump from one edge to the other with a clockwise rotation"),
        DatabaseModel(id: 1, type: "Jumps", name: "Flip", descr: "a jump from one edge to the other with a counter-clockwise rotation, taking off from the edge"),
        DatabaseModel(id: 1, type: "Jumps", name: "Lutz", descr: "a jump from one edge to the other with a clockwise rotation, taking off from the edge"),
        DatabaseModel(id: 1, type: "Spins", name: "Upright Spin", descr: "a spin on one foot in any body position"),
        DatabaseModel(id: 1, type: "Spins", name: "Sit Spin", descr: "a spin on one foot with the free leg extended forward"),
        DatabaseModel(id: 1, type: "Spins", name: "Camel Spin", descr: "a spin on one foot with the free leg extended backward"),
        DatabaseModel(id: 1, type: "Spins", name: "Layback Spin", descr: "a spin on one foot with the free leg extended backward, the body parallel to the ice"),
        DatabaseModel(id: 1, type: "Spins", name: "Inverted Spin", descr: "a spin on one foot with the free leg extended forward, the body parallel to the ice"),
        DatabaseModel(id: 1, type: "Step Sequences", name: "Step Sequence", descr: "a series of different steps, turns, edges, hops, jumps, and spins performed to music in a specific rhythm"),

    ]

}
