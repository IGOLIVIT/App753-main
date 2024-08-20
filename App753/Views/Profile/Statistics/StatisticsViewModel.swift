//
//  StatisticsViewModel.swift
//  App753
//
//  Created by IGOR on 05/08/2024.
//

import SwiftUI
import CoreData

final class StatisticsViewModel: ObservableObject {
    
    @AppStorage("tr") var tr: Int = 0
    @AppStorage("per") var per: Int = 0
    

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var types: [String] = ["Performance", "Training"]
    @Published var currentType = ""

    @Published var stName = ""
    @Published var stDate: Date = Date()
    @Published var stTime = ""
    @Published var stJumps = ""
    @Published var stSpins = ""
    @Published var stSec = ""
    @Published var stType = ""
    
    @Published var statistics: [StatModel] = []
    @Published var selectedStatistic: StatModel?

    func addStatistic() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "StatModel", into: context) as! StatModel

        loan.stName = stName
        loan.stDate = stDate
        loan.stTime = stTime
        loan.stJumps = stJumps
        loan.stSpins = stSpins
        loan.stSec = stSec
        loan.stType = stType

        CoreDataStack.shared.saveContext()
    }

    func fetchStatistics() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StatModel>(entityName: "StatModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.statistics = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.statistics = []
        }
    }
}
