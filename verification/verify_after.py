from playwright.sync_api import sync_playwright

def verify_writer_and_no_jquery():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        # Navigate to the local server
        page.goto("http://localhost:8000/index.html")

        # 1. Verify Writer still initializes
        # Wait for the writer to be initialized.
        try:
            page.wait_for_function("() => window.writer !== undefined", timeout=5000)
        except:
            print("Error: Writer not initialized.")
            exit(1)

        # Check if the quiz target has content (SVG or canvas)
        target_content = page.locator("#quiz-target > svg, #quiz-target > canvas")
        try:
            target_content.first.wait_for(state="visible", timeout=5000)
        except:
            print("Error: Canvas/SVG not visible.")
            exit(1)

        print("Writer initialized successfully.")

        # 2. Verify jQuery is NOT loaded
        is_jquery_loaded = page.evaluate("() => typeof window.jQuery !== 'undefined'")
        if is_jquery_loaded:
            print("Error: jQuery is still loaded!")
            exit(1)
        else:
            print("Success: jQuery is NOT loaded.")

        # Take a screenshot
        page.screenshot(path="verification/after_changes.png")

        browser.close()

if __name__ == "__main__":
    verify_writer_and_no_jquery()
