//
//  AlertManagerKey.swift
//  
//
//  Created by Alex Nagy on 12.08.2024.
//

import SwiftUI

public struct AlertManagerKey: EnvironmentKey {
    @MainActor
    public static let defaultValue = AlertManager()
}
