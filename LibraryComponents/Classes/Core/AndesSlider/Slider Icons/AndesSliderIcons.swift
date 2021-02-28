//
//  AndesSliderIcons.swift
//  AndesUI
//
//  Created by Victor Chang on 28/02/2021.
//

import Foundation

@objc public class AndesSliderIcon: NSObject {

	@objc public private(set) var icon: UIImage
	@objc public private(set) var orientation: AndesSliderOrientation

	@objc public init(icon: UIImage, orientation: AndesSliderOrientation) {
		self.icon = icon
		self.orientation = orientation
	}
}

@objc public enum AndesSliderOrientation: Int, AndesEnumStringConvertible {

	case left
	case right

	public static func keyFor(_ value: AndesSliderOrientation) -> String {
		switch value {
			case .left: return "LEFT"
			case .right: return "RIGHT"
		}
	}
}
