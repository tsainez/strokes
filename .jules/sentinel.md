# Sentinel's Journal

## 2025-12-17 - WKWebView JavaScript Injection
**Vulnerability:** User input from a `UISearchBar` was directly interpolated into a JavaScript string passed to `WKWebView.evaluateJavaScript`, allowing for potential Cross-Site Scripting (XSS) or arbitrary code execution within the WebView context.
**Learning:** String interpolation in Swift does not automatically escape characters for other contexts (like JavaScript). Trusting user input in `evaluateJavaScript` is a common but dangerous pattern.
**Prevention:** Always use `JSONSerialization` to encode data passed to `evaluateJavaScript`. Since a valid JSON string is also a valid JavaScript string literal, this ensures all special characters are properly escaped.
