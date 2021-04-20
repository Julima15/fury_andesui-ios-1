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
	static func provide(_ type: AndesSliderType?, _ limitValue: AndesSliderLimit, leftIcon: String?, rightIcon: String?) -> AndesSliderTypeProtocol {
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
