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

    var backgroundColor: UIColor?
//	var leftIcon: AndesSliderIcon?
//	var rightIcon: AndesSliderIcon?
//	var sliderAmmount: AndesSliderLimit?

    init() {}

	init(type: AndesSliderTypeProtocol, hierarchy: AndesSliderHierarchyProtocol) {
        self.backgroundColor = hierarchy.backgroundColor
//		self.leftIcon = slider.leftIcon
//		self.rightIcon = slider.rightIcon
//		self.sliderAmmount = slider.sliderLimitValue
    }
}
