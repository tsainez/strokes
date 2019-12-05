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
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Instructions", message: "Type in a Chinese character, traditional or simplified, into the searchbar and hit enter to practice writing the stroke order for that character!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
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

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
