# DMPageController

[![CI Status](https://img.shields.io/travis/66667091/DMPageController.svg?style=flat)](https://travis-ci.org/66667091/DMPageController)
[![Version](https://img.shields.io/cocoapods/v/DMPageController.svg?style=flat)](https://cocoapods.org/pods/DMPageController)
[![License](https://img.shields.io/cocoapods/l/DMPageController.svg?style=flat)](https://cocoapods.org/pods/DMPageController)
[![Platform](https://img.shields.io/cocoapods/p/DMPageController.svg?style=flat)](https://cocoapods.org/pods/DMPageController)

![Simulator Screen Recording - iPhone SE (3rd generation) - 2023-03-14 at 11 21 17](https://user-images.githubusercontent.com/66667091/224876490-19f4f24b-ceb5-44e9-b92b-510fc4e29fab.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Swift 5.0
* XCode 14.2 (14C18)
* iOS 14.0 (Min SDK)
* Not Use Autolayout

## How to used

```swift
import JMPageController

public enum PageContollerType {
    case DMNormal
    case DMMoveSlide
    case DMCustomSlide(size: CGSize)
}

let pageController: DMPageControlView = {
    let view = DMPageControlView()
    return view
}()

override func viewDidLoad() {
    super.viewDidLoad()
    //SetUp Page Controller
    pageController.setView(pages: 5, pageContollerType: .JMNormal)
    
    //Add Page Controller
    self.view.addSubview(pageController)
    
    //SetUp Layout
    NSLayoutConstraint.activate([
        pageController.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        pageController.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
}
```

## Installation

DMPageController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DMPageController'
```

## Author

isouvezz@gmail.com

## License

JMPageController is available under the MIT license. See the LICENSE file for more info.
