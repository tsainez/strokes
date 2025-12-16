## 2024-05-23 - JavaScript Injection in WebView
**Vulnerability:** Found a JavaScript injection vulnerability in `CanvasController.swift`. User input from the search bar was directly interpolated into a JavaScript string passed to `evaluateJavaScript`.
**Learning:** Even in native apps (Swift), WebViews introduce web-based vulnerabilities like XSS/Injection. Direct string interpolation for JS commands is dangerous.
**Prevention:** Always use a serialization mechanism (like `JSONSerialization` in Swift) to encode data passed to JavaScript, ensuring it is treated as data and not executable code. The pattern `var args = \(jsonString); func(args[0])` is a robust way to pass arguments.
