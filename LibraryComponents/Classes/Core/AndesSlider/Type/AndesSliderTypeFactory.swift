//
//  
//  AndesSliderTypeFactory.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

class AndesSliderTypeFactory {
	static func provide(_ type: AndesSliderType?, _ leftIcon: AndesSliderIcon?, _ rightIcon: AndesSliderIcon?, _ limitValue: AndesSliderLimit?) -> AndesSliderTypeProtocol {
        switch type {
        case .simple:
            return AndesSliderTypeSimple()
        case .icons:
            return AndesSliderTypeIcons(leftIcon: leftIcon, rightIcon: rightIcon)
        case .limits:
            return AndesSliderTypeLimits(limit: limitValue)
		case .none:
            return AndesSliderTypeSimple()
		}
    }
}
