//
//  URL+Query.swift
//  Area51
//
//  Created by Alexandre Garrefa on 11/01/2019.
//  Copyright © 2019 Garrefa. All rights reserved.
//

import Foundation

extension URL {
    func valueOf(queryParam: String) -> String? {
        let queryItems =
            URLComponents(url: self, resolvingAgainstBaseURL: true)?.queryItems
        let param = queryItems?.first(where: { item -> Bool in
            item.name == queryParam
        })
        return param?.value
    }
}
