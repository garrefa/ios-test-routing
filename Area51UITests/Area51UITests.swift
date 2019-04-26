//
//  Area51UITests.swift
//  Area51UITests
//
//  Created by Alexandre Garrefa on 10/01/2019.
//  Copyright © 2019 Garrefa. All rights reserved.
//

import XCTest

class Area51UITests: XCTestCase {

    var app: XCUIApplication = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launchEnvironment = defaultLaunchOptions
        setLaunchRoute(host: "blue?title=UITestingBlueViewController")
        app.launch()
    }

    func testExample() {
        let exp = XCTestExpectation(description: "stop")
        wait(for: [exp], timeout: 60)
    }

    var defaultLaunchOptions: [String: String] {
        return ["SomethingNice": "Yeah"]
    }

    func setLaunchOption(_ option: String, forKey key: String) {
        var currentLaunchOptions = app.launchEnvironment
        currentLaunchOptions[key] = option
        app.launchEnvironment = currentLaunchOptions
    }

    func setLaunchRoute(host: String) {
        debugPrint(#function)
        setLaunchOption(
            "myapp://\(host)",
            forKey: UIApplication.LaunchOptionsKey.url.rawValue)
    }
}
