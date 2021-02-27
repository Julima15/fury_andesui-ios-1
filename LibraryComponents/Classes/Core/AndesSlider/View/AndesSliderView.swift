//
//  
//  AndesSliderView.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an AndesSlider
 */
internal protocol AndesSliderView: UIView {

    func update(withConfig config: AndesSliderViewConfig)
	func onValueChanged(value: Int)

}
