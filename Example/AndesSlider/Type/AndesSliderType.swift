//
//  
//  AndesSliderType.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

/// Used to define the colors of an AndesSlider
@objc public enum AndesSliderType: Int, AndesEnumStringConvertible {
    case success
    case error

    public static func keyFor(_ value: AndesSliderType) -> String {
        switch value {
        case .success: return "SUCCESS"
        case .error: return "ERROR"
        }
    }
}
