# DMPageController

[![CI Status](https://img.shields.io/travis/66667091/DMPageController.svg?style=flat)](https://travis-ci.org/66667091/DMPageController)
[![Version](https://img.shields.io/cocoapods/v/DMPageController.svg?style=flat)](https://cocoapods.org/pods/DMPageController)
[![License](https://img.shields.io/cocoapods/l/DMPageController.svg?style=flat)](https://cocoapods.org/pods/DMPageController)
[![Platform](https://img.shields.io/cocoapods/p/DMPageController.svg?style=flat)](https://cocoapods.org/pods/DMPageController)

![Simulator Screen Recording - iPhone 14 Pro - 2023-04-23 at 10 52 26](https://user-images.githubusercontent.com/66667091/233815185-960f276c-26dc-4398-afd3-e6fc4f2b33ad.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Swift 5.0
* XCode 14.3(14E222b)
* iOS 15.0 (Min SDK)
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

@IBAction func nextButton(_ sender: Any) {
//The page is the index value you want to move.
     pageController.changePage(page)
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
