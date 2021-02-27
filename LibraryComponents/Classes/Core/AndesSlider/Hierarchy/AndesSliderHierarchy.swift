//
//  
//  AndesSliderHierarchy.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

/// Used to define the style of an AndesSlider
@objc public enum AndesSliderHierarchy: Int, AndesEnumStringConvertible {
    case loud
    case quiet

    public static func keyFor(_ value: AndesSliderHierarchy) -> String {
        switch value {
        case .loud: return "LOUD"
        case .quiet: return "QUIET"
        }
    }
}
