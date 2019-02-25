//
//  ViewController.swift
//  FirebasePlayground
//
//  Created by Superdigital on 25/02/19.
//  Copyright © 2019 Superdigital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbMainTitle: UILabel!
    @IBOutlet weak var lbBody: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector (didReceiveNotificationObject(n:)), name: NSNotification.Name(rawValue: "Cachorro"), object: nil)
    }

    
    @objc func didReceiveNotificationObject(n: NSNotification) {
        
        let uNObject = n.object as? NotificationObject
        lbMainTitle.text = uNObject?.title
        lbBody.text = uNObject?.body
    }
}

