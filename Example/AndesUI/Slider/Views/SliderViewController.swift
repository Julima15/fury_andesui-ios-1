//
//  SliderViewController.swift
//  AndesUI-demoapp
//
//  Created by Victor Chang on 25/02/2021.
//  Copyright © 2021 MercadoLibre. All rights reserved.
//

import Foundation
import AndesUI

protocol SliderView: NSObject {

}

class SliderViewController: UIViewController, SliderView {

	@IBOutlet weak var andesSlider: AndesSlider!

	var type: AndesSliderType? = .simple

	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Andes Slider"

		self.andesSlider.sliderMinValue = 1
		self.andesSlider.sliderMaxValue = 200

	}
}
