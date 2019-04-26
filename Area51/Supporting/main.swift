//
//  main.swift
//  Area51
//
//  Created by Alexandre Garrefa on 10/01/2019.
//  Copyright © 2019 Garrefa. All rights reserved.
//

import UIKit

let appDelegateClass: AnyClass =
    NSClassFromString("TestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(appDelegateClass))
