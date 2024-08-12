//
//  AlertManager+EnvironmentValues.swift
//
//
//  Created by Alex Nagy on 12.08.2024.
//

import SwiftUI

public extension EnvironmentValues {
    
    /// Environment to present alerts / confrimation dialogs
    var alertManager: AlertManager {
        get {
            return self[AlertManagerKey.self]
        }
        set {
            self[AlertManagerKey.self] = newValue
        }
    }
}
