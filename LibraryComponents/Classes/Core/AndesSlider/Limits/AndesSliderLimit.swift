//
//  AndesSliderLimit.swift
//  AndesUI
//
//  Created by Victor Chang on 28/02/2021.
//

import Foundation

@objc public class AndesSliderLimit: NSObject {
	@objc public private(set) var minValue: Int
	@objc public private(set) var maxValue: Int

	@objc public init(minValue: Int, maxValue: Int) {
		self.minValue = minValue
		self.maxValue = maxValue
	}
}
