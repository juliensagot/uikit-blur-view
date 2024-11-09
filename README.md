# BlurView
High-performance blur effect for UIKit, similar to SwiftUI’s [blur modifier](https://developer.apple.com/documentation/swiftui/view/blur(radius:opaque:)).

<img src="https://hostr.co/file/fsK44ma70bWo/Example.gif" width="375" alt="moon-face emoji fading in and out with a smooth blur animation">

## Usage

Instantiate `BlurView` and add any views you want to blur as its subviews.  
Adjust its `blurRadius` property to control the level of blur.

```swift
import BlurView

let blurView = BlurView()
blurView.blurRadius = 20
blurView.addSubview(mySubview)
```

## Animating blur radius
This view supports animating the blur radius using UIKit’s animation APIs:
```swift
UIView.animate(withDuration: 0.3) {
  blurView.blurRadius = 10
}
```

## Swift Package
```swift
.dependencies: [
  .package(url: "https://github.com/juliensagot/uikit-blur-view", .upToNextMajor(from: "1.0.0"))
]
.targets: [
  .target(
    name: "Foo",
    dependencies: [
      .product(name: "BlurView", package: "uikit-blur-view")
    ]
  )
]
```

## Example
Please take a look at the [DemoApp](Examples/DemoApp/).

## ⚠️ Caution
The Gaussian blur effect is produced via a call to a private API.  
Although it has been obfuscated, using this package might result in **your app being rejected by Apple**, although this is very unlikely.  
I shall not be held responsible if such an event occurs.
