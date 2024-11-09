// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "uikit-blur-view",
  products: [
    .library(
      name: "BlurView",
      targets: ["BlurView"]
    )
  ],
  targets: [
    .target(
      name: "BlurView"
    )
  ]
)
