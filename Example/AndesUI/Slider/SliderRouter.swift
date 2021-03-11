//
//  SliderRouter.swift
//  AndesUI-demoapp
//
//  Created by Victor Chang on 26/02/2021.
//  Copyright © 2021 MercadoLibre. All rights reserved.
//

import Foundation

class SliderRouter: HomeRouterProtocol {
	func route(from: UIViewController) {

		from.navigationController?.pushViewController(SliderViewController(), animated: true)
	}
}
