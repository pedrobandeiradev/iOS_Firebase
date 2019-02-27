//
//  LocalNotificationDelegate.swift
//  FirebasePlayground
//
//  Created by Superdigital on 27/02/19.
//  Copyright © 2019 Superdigital. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationDelegate {
    
    func setupLocalNotificationScheduledAlarm(usingContent nObjc: UNMutableNotificationContent, uuidLabel: String ,forType typeOfOccurrence: OcurrenceType, withInterval interval: Int, repetitive: Bool) {

        //Date Components
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
        //Notification Trigger
        var trigger: UNCalendarNotificationTrigger?
        switch typeOfOccurrence {
        case .day://Must be called as long as the period allows
            dateComponents.day = interval
            break
        case .hour://Must be called as long as the period allows
            dateComponents.hour = interval
            break
        case .month: //Possibly every 30 days from the first date
            dateComponents.day = interval
        case .weekday: //Must be called as many times as the number of days scheduled and as long as the period allows
            dateComponents.weekday = interval
        }
        
        trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: repetitive)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(UNNotificationRequest(identifier: nObjc.userInfo[uuidLabel] as! String, content: nObjc, trigger: trigger)) { (_) in }
    }
}

enum OcurrenceType {
    case day
    case hour
    case month
    case weekday
}

