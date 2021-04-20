//
//  AndesSliderTypeLimits.swift
//  AndesUI
//
//  Created by Victor Chang on 27/02/2021.
//

import Foundation

internal struct AndesSliderTypeLimits: AndesSliderTypeProtocol {

	var min: String
	var max: String

	init(limit: AndesSliderLimit) {
		self.min = limit.minValue
		self.max = limit.maxValue
	}
}
