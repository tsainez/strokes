from playwright.sync_api import sync_playwright

def verify_writer():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        # Navigate to the local server
        page.goto("http://localhost:8000/index.html")

        # Wait for the writer to be initialized.
        # demo.js sets window.writer = writer.
        # We can check if window.writer is defined.
        page.wait_for_function("() => window.writer !== undefined")

        # Check if the quiz target has content (SVG or canvas)
        # HanziWriter usually creates an SVG or Canvas element inside the target div
        target_content = page.locator("#quiz-target > svg, #quiz-target > canvas")
        target_content.first.wait_for(state="visible", timeout=5000)

        print("Writer initialized successfully.")

        # Take a screenshot
        page.screenshot(path="verification/before_changes.png")

        browser.close()

if __name__ == "__main__":
    verify_writer()
