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

	var leftIcon: String?
	var rightIcon: String?

	init() { }

	init(leftIcon: String?, rightIcon: String?) {
		self.leftIcon = leftIcon
		self.rightIcon = rightIcon
	}
}
