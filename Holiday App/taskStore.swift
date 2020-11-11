//
//  taskStore.swift
//  Holiday App
//
//  Created by Jenya Lebid on 11/10/20.
//


import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
    
    //Add more complicated stuff later if you want.
    
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}

