//
//  
//  AndesSliderViewConfig.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

/// used to define the ui of internal AndesSlider views
internal struct AndesSliderViewConfig {

    var backgroundColor: UIColor?
    var textColor: UIColor?

	var thumbColor: UIColor?
	var thumbBackgroundColor: UIColor?

    init() {}

    init(type: AndesSliderTypeProtocol, hierarchy: AndesSliderHierarchyProtocol) {
        self.textColor = type.textColor
        self.backgroundColor = hierarchy.backgroundColor
    }
}
