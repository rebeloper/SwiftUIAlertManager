//
//  AlertOptions.swift
//
//
//  Created by Alex Nagy on 10.07.2024.
//

import Foundation

public struct AlertOptions {
    var type: AlertType = .alert
    var title: String? = nil
    var message: String? = nil
    var actions: [AlertAction]? = nil
    
    public init(type: AlertType = .alert,
         title: String? = nil,
         message: String? = nil,
         actions: [AlertAction]? = nil) {
        self.type = type
        self.title = title
        self.message = message
        self.actions = actions
    }
}
