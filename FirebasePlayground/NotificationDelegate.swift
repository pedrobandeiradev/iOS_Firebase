//
//  NotificationDelegate.swift
//  FirebasePlayground
//
//  Created by Superdigital on 25/02/19.
//  Copyright © 2019 Superdigital. All rights reserved.
//

import Foundation

class NotificationDelegate {
    
    func didReceiveNotification(title: String, body: String) {
        let nObjc = NotificationObject(body: body, title: title)
        NotificationCenter.default.post(name: NSNotification.Name("Cachorro"), object: nObjc)
    }
}

struct NotificationObject {
    let body: String
    let title: String
}
