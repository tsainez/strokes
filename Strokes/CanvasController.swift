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
class CanvasController: UIViewController, UISearchBarDelegate, WKScriptMessageHandler {
    
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
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("Name: \(message.name)")
        print("Body: \(message.body as! String)")
    }
    
    // work in progress
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // hide keyboard
        let sui = "水" // default character
        
        webView.evaluateJavaScript("updateCharacter(\(searchBar.text ?? sui))") { (result, error) in
            if error == nil {
                // exit(0)
                // success
            }
        }
    }
    
    @IBAction func toggleOutline(_ sender: Any) {
        // let method = "shouldShowOutline('quiz') ? 'showOutline' : 'hideOutline';"

        webView.evaluateJavaScript("quizWriter.hideOutline();") { (result, error) in
            if error == nil {
                // exit(0)
                // success
            }
        }

    }
    
    
    @IBAction func resetQuiz(_ sender: Any) {
        webView.evaluateJavaScript("quizWriter.quiz();") { (result, error) in
            if error == nil {
                // exit(0)
                // success
            } else {
                exit(1)
            }
        }
    }
}
