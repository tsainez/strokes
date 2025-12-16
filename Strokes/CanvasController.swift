//
//  CanvasController.swift
//  Strokes
//
//  Created by Anthony Sainez on 13 February 2019.
//  Copyright © 2020 Anthony Sainez. All rights reserved.
//

import UIKit
import WebKit

// TODO: Implement WKUIDelegate.
class CanvasController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // loading an html file from local resources
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            // deletingLastPathComponent() allows WebKit to read from directory of index.html
        }
        self.hideKeyboard()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // hide keyboard
        let text = searchBar.text ?? "水"
        // Sentinel: Fix JavaScript injection by safely encoding the input
        if let data = try? JSONSerialization.data(withJSONObject: [text], options: []),
           let jsonString = String(data: data, encoding: .utf8) {
            webView.evaluateJavaScript("var args = \(jsonString); changeCharacter(args[0]);") { (result, error) in
                if error == nil {
                    // success, do nothing...
                }
            }
        }
    }
}

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
