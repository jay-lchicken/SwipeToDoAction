# SwipeToDoAction

`SwipeToDoAction` is a SwiftUI view that provides a swipe-to-delete action, designed for iOS applications. This component allows users to swipe a button to reveal a customizable action, enhancing user experience and interaction in your app.

## Features

- **Swipe Action:** Users can swipe to reveal an action button.
- **Customizable Text and Color:** Easily change the swipe text and color to fit your app's theme.
- **iOS 16 Compatible:** Requires iOS 16 or later.

## Installation

### Swift Package Manager

To integrate `SwipeToDoAction` into your project using Swift Package Manager, follow these steps:

1. Open your Xcode project.
2. Go to `File` > `Add Packages...`.
3. Enter the URL of this repository.
4. Choose the version you want to install and click "Add Package".

## Usage

Here’s a quick example of how to use the `SwipeToDoAction` component in your SwiftUI view:

```swift
import SwiftUI

struct ContentView: View {
    @State private var isSwiped = false

    var body: some View {
        SwipeToDoAction(
            isSwiped: $isSwiped,
            swipeText: "Delete",
            swipeColor: .red
        )
    }
}

