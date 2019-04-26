//
//  AppDelegate.swift
//  Area51
//
//  Created by Alexandre Garrefa on 10/01/2019.
//  Copyright © 2019 Garrefa. All rights reserved.
//

import UIKit

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var router: AppRouter = AppRouter()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool {
        registerAppRoutes()
        window = UIWindow()
        handleLaunchURL(
            URL(string: ProcessInfo.processInfo.environment[UIApplication.LaunchOptionsKey.url.rawValue] ?? ""))
        window?.makeKeyAndVisible()
        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        handleLaunchURL(url)
        return true
    }

    func handleLaunchURL(_ url: URL?) {
        guard let window = window else { return }

        guard let url = url else {
            let rootViewController = UINavigationController(
                rootViewController: RedViewController())
            window.rootViewController = rootViewController
            return
        }

        guard let rootViewController = window.rootViewController else {
            router.make(url: url, rootInWindow: window)
            return
        }

        guard let nav = rootViewController as? UINavigationController else {
            router.present(url: url, in: rootViewController)
            return
        }

        router.push(url: url, in: nav)
    }
}

// MARK: - App Routes

extension AppDelegate {
    func registerAppRoutes() {

        router.registerRoute(AppRoute(
            host: AppRoutes.FeatureX.blue(title: "Default blue"),
            builder: { url in
                let viewController = BlueViewController()
                viewController.title = url.valueOf(queryParam: "title")
                return viewController
        }))

        router.registerRoute(AppRoute(
            host: AppRoutes.FeatureX.red,
            builder: { _ in RedViewController() }))
    }
}
