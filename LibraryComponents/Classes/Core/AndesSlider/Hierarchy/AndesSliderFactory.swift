//
//  
//  AndesSliderFactory.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

internal class AndesSliderHierarchyFactory {
    static func provide(_ hierarchy: AndesSliderHierarchy) -> AndesSliderHierarchyProtocol {
        switch hierarchy {
        case .loud:
            return AndesSliderHierarchyLoud()
        case .quiet:
            return AndesSliderHierarchyQuiet()
        }
    }
}
