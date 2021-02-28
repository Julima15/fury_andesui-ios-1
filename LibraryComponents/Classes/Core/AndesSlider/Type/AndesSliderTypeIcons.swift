//
//  
//  AndesSliderTypeSuccess.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

class AndesSliderTypeIcons: AndesSliderTypeProtocol {

	var leftIcon: AndesSliderIcon?
	var rightIcon: AndesSliderIcon?

	init() { }

	init(leftIcon: AndesSliderIcon?, rightIcon: AndesSliderIcon?) {
		self.leftIcon = leftIcon
		self.rightIcon = rightIcon
	}
}
