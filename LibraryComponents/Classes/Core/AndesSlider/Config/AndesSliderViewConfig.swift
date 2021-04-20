//
//  
//  AndesSliderViewConfig.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

internal struct AndesSliderViewConfig {

	var leftIcon: String? = ""
	var rightIcon: String? = ""
	var minValue: Double! = 0
	var maxValue: Double! = 100
	var type: AndesSliderType = .simple
	var state: AndesSliderStateProtocol! = AndesSliderStateIdle()

	init() { }

	init(for slider: AndesSlider) {
		self.minValue = slider.sliderMinValue as? Double ?? 0
		self.maxValue = slider.sliderMaxValue as? Double ?? 100
		self.leftIcon = slider.leftIcon
		self.rightIcon = slider.rightIcon
		self.type = slider.type
		self.state = AndesSliderStateFactory.provideState(key: slider.state)
    }
}
