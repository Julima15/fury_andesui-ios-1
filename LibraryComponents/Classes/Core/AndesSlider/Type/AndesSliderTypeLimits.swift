//
//  AndesSliderTypeLimits.swift
//  AndesUI
//
//  Created by Victor Chang on 27/02/2021.
//

import Foundation

internal struct AndesSliderTypeLimits: AndesSliderTypeProtocol {

	var min: Int?
	var max: Int?

	init(limit: AndesSliderLimit?) {
		self.min = limit?.minValue
		self.max = limit?.maxValue
	}
}
