//
//  AppRouter.swift
//  Area51
//
//  Created by Alexandre Garrefa on 11/01/2019.
//  Copyright © 2019 Garrefa. All rights reserved.
//

import UIKit

final class AppRouter: NSObject {
    private var routes: [String: AppRouteProtocol] = [:]

    func registerRoute(_ route: AppRouteProtocol) {
        let value = route.host.value()
        routes[value] = route
        print("registered route to: \(value)")
    }

    func present(
        url: URL,
        in presenter: UIViewController,
        animated: Bool = true,
        completion: (() -> Void)? = nil) {

        guard let viewController = viewController(forURL: url) else { return }
        print("open: \(url.host ?? "invalid host")")
        presenter.present(
            viewController,
            animated: animated,
            completion: completion)
    }

    func push(url: URL, in nav: UINavigationController, animated: Bool = true) {
        guard let viewController = viewController(forURL: url) else { return }
        print("open: \(url.host ?? "invalid host")")
        nav.pushViewController(viewController, animated: animated)
    }

    func make(url: URL, rootInWindow window: UIWindow) {
        guard let viewController = viewController(forURL: url) else { return }
        print("open: \(url.host ?? "invalid host")")
        window.rootViewController = viewController
    }

    private func route(forURL url: URL) -> AppRouteProtocol? {
        guard let host = url.host, let route = routes[host] else {
            let host = url.host ?? "host undefined"
            print("no route to \(host)")
            return nil
        }
        return route
    }

    private func viewController(forURL url: URL) -> UIViewController? {
        guard let route = route(forURL: url) else { return nil }
        guard let viewController = route.build(fromURL: url) else {
            print("failed to create view controller for: \(route.host)")
            return nil
        }
        return viewController
    }
}
