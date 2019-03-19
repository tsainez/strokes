//
//  CanvasController.swift
//  Strokes
//
//  Created by Anthony Sainez on 2/13/19.
//  Copyright © 2019 Anthony Sainez. All rights reserved.
//

import UIKit
import WebKit

// TODO: Implement WKUIDelegate.
class CanvasController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    // TODO: Have JavaScript and JQuery communicate with Swift to provide the character.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // loading an html file from local resources
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            // deletingLastPathComponent() allows WebKit to read from directory of index.html
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let character = searchBar.text
    }
}
