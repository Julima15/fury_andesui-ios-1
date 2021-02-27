//
//  
//  AndesSliderAbstractView.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import UIKit

class AndesSliderAbstractView: UIView, AndesSliderView {

	func onValueChanged(value: Int) {
		print("Slider Value Changed")
	}

    @IBOutlet weak var componentView: UIView!
	@IBOutlet weak var sliderView: UISlider!
	@IBOutlet weak var toolTipLabel: UILabel!
	@IBOutlet weak var valueLabel: UILabel!

    var config: AndesSliderViewConfig
    init(withConfig config: AndesSliderViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = AndesSliderViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: AndesSliderViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(componentView)
        componentView.translatesAutoresizingMaskIntoConstraints = false
        componentView.pinToSuperview()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()
    }

    /// Override this method on each Badge View to setup its unique components

    func updateView() {
        self.backgroundColor = config.backgroundColor
    }
}
