//
//  OpenSIteViewController.swift
//  AlcoProject 2.0
//
//  Created by Sergey Vorobey on 06/02/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import UIKit
import WebKit

class OpenSIteViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if let topItem = navigationController?.navigationBar.topItem {
                   topItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                               style: .plain,
                                                               target: nil,
                                                               action: nil)
               }

        guard let url = URL(string: "https://www.jackdaniels.com") else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}
