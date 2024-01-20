//
//  UserStatus.swift
//  Messenger
//
//  Created by Alexander Zarutskiy on 20.01.2024.
//

import Foundation

class StatusViewModel: ObservableObject {
    @Published var status: UserStatus = .notConfigured
    
    func updateStatus(_ status: UserStatus) {
        self.status = status
    }
}

enum UserStatus: Int, CaseIterable {
    case notConfigured
    case available
    case busy
    case school
    case movies
    case work
    case batteryLow
    case meeting
    case gym
    case sleeping
    case urgentCallOnly
    
    var title: String {
        switch self {
        case .notConfigured:
            return "Click here to update your status"
        case .available:
            return "Available"
        case .busy:
            return "Busy"
        case .school:
            return "At school"
        case .movies:
            return "At the movies"
        case .work:
            return "At work"
        case .batteryLow:
            return "Battery about to die"
        case .meeting:
            return "In a meeting"
        case .gym:
            return "At the gym"
        case .sleeping:
            return "Sleeping"
        case .urgentCallOnly:
            return "Urgent calls only"
        }
    }
}
