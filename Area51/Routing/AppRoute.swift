//
//  AppRoute.swift
//  Area51
//
//  Created by Alexandre Garrefa on 10/01/2019.
//  Copyright © 2019 Garrefa. All rights reserved.
//

import UIKit

protocol AppRouteProtocol {
    var host: AppRouteHost { get }
    var builder: (URL) -> (UIViewController?) { get }

    func build(fromURL url: URL) -> UIViewController?
}

struct AppRoute: AppRouteProtocol {
    let host: AppRouteHost
    let builder: (URL) -> (UIViewController?)

    func build(fromURL url: URL) -> UIViewController? {
        return builder(url)
    }
}
