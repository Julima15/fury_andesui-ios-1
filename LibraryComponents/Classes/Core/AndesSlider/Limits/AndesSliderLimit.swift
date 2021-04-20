//
//  AndesSliderLimit.swift
//  AndesUI
//
//  Created by Victor Chang on 28/02/2021.
//

import Foundation

@objc public class AndesSliderLimit: NSObject {
	@objc public var minValue: String
	@objc public var maxValue: String

	@objc public init(minValue: String, maxValue: String) {
		self.minValue = minValue
		self.maxValue = maxValue
	}
}
