//
//  
//  AndesSliderViewConfigFactory.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

internal class AndesSliderViewConfigFactory {
    static func provideInternalConfig(type: AndesSliderType, hierarchy: AndesSliderHierarchy) -> AndesSliderViewConfig {
        let typeIns = AndesSliderTypeFactory.provide(type)
        let hierarchyIns = AndesSliderHierarchyFactory.provide(hierarchy)

        let config = AndesSliderViewConfig(type: typeIns, hierarchy: hierarchyIns)

        return config
    }
}
