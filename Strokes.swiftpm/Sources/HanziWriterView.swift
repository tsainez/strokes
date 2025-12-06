import SwiftUI
import WebKit

struct HanziWriterView: UIViewRepresentable {
    let character: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = .clear

        // Find the html file in the bundle
        // Since we are in a Swift Package with resources, we use Bundle.module
        if let url = Bundle.module.url(forResource: "index", withExtension: "html", subdirectory: "web") {
            // allowingReadAccessTo must be the directory containing index.html
             webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        } else {
            print("Could not find index.html")
             // Fallback attempt
             if let url = Bundle.module.url(forResource: "index", withExtension: "html") {
                  webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
             }
        }

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Call the javascript function to change the character
        let js = "changeCharacter('\(character)')"
        uiView.evaluateJavaScript(js) { _, error in
            if let error = error {
                print("Error updating character: \(error)")
            }
        }
    }
}
