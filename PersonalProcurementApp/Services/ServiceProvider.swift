//
//  ServiceProvider.swift
//  PersonalProcurementApp
//
//  Created by Aleksandrs Maklakovs on 23/11/2024.
//

import Foundation

class ServiceProvider {
    static let shared = ServiceProvider()
    
    private init() {}
    
    private var recurring_event_service = RecurringEventService()
    
    func getRecurringEventService() -> RecurringEventService {
        return recurring_event_service
    }
}
