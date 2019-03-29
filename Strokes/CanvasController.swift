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
    @IBOutlet weak var searchBar: UISearchBar! // TODO: Have JavaScript and JQuery communicate with Swift to provide the character.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // loading an html file from local resources
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            // deletingLastPathComponent() allows WebKit to read from directory of index.html
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // hide keyboard
        let sui = "水" // default character
        
        webView.evaluateJavaScript("changeCharacter('\(searchBar.text ?? sui)')") { (result, error) in
            if error == nil {
                // success
            }
        }
    }
    
    // warning, here lies some very bad code
    var outlineStatus = false
    
    @IBAction func toggleOutline(_ sender: Any) {
        if outlineStatus == true {
            webView.evaluateJavaScript("quizWriter.showOutline()") { (result, error) in
                if error == nil {
                    // success
                }
            }
            
            outlineStatus = false
        } else {
            webView.evaluateJavaScript("quizWriter.hideOutline()") { (result, error) in
                if error == nil {
                    // success
                }
            }
            
            outlineStatus = true
        }
    }
    
    
    @IBAction func resetQuiz(_ sender: Any) {
        webView.evaluateJavaScript("quizWriter.quiz();") { (result, error) in
            if error == nil {
                // success
            } else {
                exit(1)
            }
        }
    }
}
