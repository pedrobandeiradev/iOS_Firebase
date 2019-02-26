//
//  AppDelegate.swift
//  FirebasePlayground
//
//  Created by Superdigital on 25/02/19.
//  Copyright © 2019 Superdigital. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

let FCM_TOKEN = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    var notificationDelegate: NotificationDelegate?
    var fcmToken: String? {
        didSet {
            if let token = fcmToken {
                UserDefaults.standard.set(token, forKey: FCM_TOKEN)
                print("FCM Token: \(token)")
            }
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        notificationDelegate = NotificationDelegate()
        return true
    }
    //Notification in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let body = notification.request.content.body
        let title = notification.request.content.title
        notificationDelegate?.didReceiveNotification(title: title, body: body)
    }
    //Notification in background
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let body = response.notification.request.content.body
        let title = response.notification.request.content.title
        notificationDelegate?.didReceiveNotification(title: title, body: body)
    }
    //Retrieve FCM Token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        InstanceID.instanceID().instanceID {[weak self] (result, _) in
            if let result = result {
                self?.fcmToken = result.token
            }
        }
    }
}

