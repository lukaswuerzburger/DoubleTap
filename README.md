<p align="center">
    <img src="https://raw.githubusercontent.com/lukaswuerzburger/DoubleTap/main/readme-images/logo.png" alt="Double Tap Logo" title="Double Tap Logo" width="128"  height="128"/><br/>
    <b>DoubleTap</b><br/>
    <br/>
    <img src="https://img.shields.io/badge/Swift-5-orange" alt="Swift Version 5" title="Swift Version 5"/>
    <a href="https://travis-ci.com/lukaswuerzburger/DoubleTap"><img src="https://travis-ci.com/lukaswuerzburger/DoubleTap.svg?branch=main" alt="Build Status" title="Build Status"/></a>
    <img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square" alt="License MIT" title="License MIT"/>
</p>


## Contents

- ✍️ [Description](#%EF%B8%8F-description)
- 🖥 [Usage](#-usage)
- 💻 [Installation](#-installation)


## ✍️ Description

DoubleTap provides an easy way to handle both taps of a double tap individually. This comes in handy specifically when you perform view updates after the first tap, e.g. highlighting a table view row or collection view item. Normally, after you handle the first click to update the view, the second tap will be lost because the tap gesture is a view and thus re-initialized and the sequence of taps is broken.   


## 🖥 Usage

First, import the library:

```swift
import DoubleTap
```

Then you can use the `onTapGesture(firstTap:secondTap:)` modifier on any `View`:

```swift
struct MyView: View {

    @State var isSelected: Bool = false
    @State var isShowingDetail: Bool = false

    var body: some View {
        Text("Text")
            .background(isSelected ? Color.green : Color.blue)
            .onTapGesture(firstTap: {
                isSelected = true
            }, secondTap: {
                isShowingDetail = true
            })
            .sheet(isPresented: $isShowingDetail) {
                Text("Detail")
            }
    }
}
```

## 💻 Installation

Add this to your dependencies in Xcode or via Package.swift:

```
.package("DoubleTap", url: "https://github.com/lukaswuerzburger/DoubleTap", from: "1.0.0")
```
