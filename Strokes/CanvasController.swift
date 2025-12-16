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

        searchBar.placeholder = "Enter a character (e.g., 水)"
        searchBar.accessibilityLabel = "Character Search"
        searchBar.accessibilityHint = "Type a Chinese character to practice its stroke order"
        webView.accessibilityLabel = "Stroke Order Canvas"

        self.hideKeyboard()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // hide keyboard
        webView.evaluateJavaScript("changeCharacter('\(searchBar.text ?? "水")')") { (result, error) in
            if error == nil {
                // success, do nothing...
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
