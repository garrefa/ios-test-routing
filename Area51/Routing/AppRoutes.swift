//
//  AppRoutes.swift
//  Area51
//
//  Created by Alexandre Garrefa on 11/01/2019.
//  Copyright © 2019 Garrefa. All rights reserved.
//

import UIKit

struct AppRoutes {}

extension AppRoutes {
    enum FeatureX: AppRouteHost {
        case red
        case blue(title: String)

        func value() -> String {
            switch self {
            case .red:
                return "red"
            case .blue:
                return "blue"
            }
        }

        func routeTo() {
            var url: URL?
            switch self {
            case .blue(let title):
                url = URL(string: "myapp://\(value())?title=\(title)")
            default:
                url = URL(string: "myapp://\(value())")
            }
            guard let routingURL = url else { return }
            AppRoutes.FeatureX.openURL(routingURL)
        }
    }
}

protocol AppRouteHost {
    func value() -> String
    func routeTo()
}

extension AppRouteHost {
    static func openURL(_ url: URL) {
        UIApplication.shared.open(
            url,
            options: [:],
            completionHandler: nil)
    }
}
