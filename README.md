# Strokes

Strokes is a modern iOS application prototype for practicing Chinese character stroke order. It leverages [Hanzi Writer](https://chanind.github.io/hanzi-writer/) for animations and quizzes.

## Project Structure

This project has been overhauled to use a modern Swift Playgrounds App structure (`.swiftpm`), making it portable and easy to edit in both Xcode and Swift Playgrounds on iPad/Mac.

- **Strokes.swiftpm**: The main project bundle.
  - **Sources**: Contains the SwiftUI source code (`StrokesApp`, `ContentView`, etc.).
  - **Resources**: Contains web assets (`index.html`, `hanzi-writer.min.js`, etc.).
  - **Package.swift**: Project definition.

## Features

- **Stroke Order Animation**: Watch and learn how to write Chinese characters.
- **Practice Mode**: Test your knowledge with interactive quizzes.
- **Search**: Look up any character.
- **Modern UI**: Built with SwiftUI.

## Usage

1. Open `Strokes.swiftpm` in Xcode or Swift Playgrounds.
2. Run the app on a simulator or device.
3. Enter a character in the search bar to practice.

## TODO

- Dark mode compatibility improvements.
- Practice sets customization.
- Character completion progress indicators.
- Offline support for stroke data.

## Credits

- [Hanzi Writer](https://chanind.github.io/hanzi-writer/)
- [Shaunak Kishore](mailto:kshaunak@gmail.com)'s project "[Make Me A Hanzi](https://www.skishore.me/makemeahanzi/)"

## License

Strokes is released under the MIT license. [See LICENSE](LICENSE) for details.
