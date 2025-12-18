## 2024-05-23 - WKWebView JavaScript Injection
**Vulnerability:** Unsanitized user input interpolated directly into `evaluateJavaScript` string in `CanvasController.swift`.
**Learning:** Interpolating strings directly into JavaScript code is a security risk (XSS/Injection). `WKWebView` executes this code in the context of the page.
**Prevention:** Use `JSONSerialization` to properly escape strings before passing them to JavaScript, ensuring data is treated as data, not code.
