//
//  CanvasController.swift
//  Strokes
//
//  Created by Anthony Sainez on 2/13/19.
//  Copyright © 2019 Anthony Sainez. All rights reserved.
//

import UIKit
import WebKit

class CanvasController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // based on https://medium.com/capital-one-tech/javascript-manipulation-on-ios-using-webkit-2b1115e7e405
        
        // Do any additional setup after loading the view.
        
        /*
        let contentController = WKUserContentController()
        let scriptSource = "put injection here"
        let script = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        contentController.addUserScript(script)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        */

        // Initializing a basic WKWebView object
        // let webView = WKWebView(frame: .zero)
        
        /*
        view.addSubview(webView)
        
        let layoutGuide = view.safeAreaLayoutGuide
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        */
        
        // loading an html file from local resources
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            // deletingLastPathComponent() allows WebKit to read from directory of index.html
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
