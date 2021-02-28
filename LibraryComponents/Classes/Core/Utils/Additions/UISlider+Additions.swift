//
//  UISlider+Additions.swift
//  AndesUI
//
//  Created by Victor Chang on 27/02/2021.
//

import Foundation

internal extension UISlider {
	func trackRect(forBounds bounds: CGRect) -> CGRect {
		let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 5.0))
		return customBounds
	}
}
