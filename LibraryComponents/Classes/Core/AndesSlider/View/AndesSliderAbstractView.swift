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

	@IBOutlet weak var valueLabelLeadingConstraint: NSLayoutConstraint!

    var config: AndesSliderViewConfig
    init(withConfig config: AndesSliderViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

	// MARK: - View initialization

    required init?(coder: NSCoder) {
        config = AndesSliderViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

	override func layoutSubviews() {
		super.layoutSubviews()
		self.componentView.layoutIfNeeded()
		let point = setUISliderThumbValueWithLabel(slider: self.sliderView)
		self.valueLabelLeadingConstraint.constant = point.x
		super.layoutSubviews()
	}

	@IBAction func sliderAction(_ sender: UISlider) {

		let x = Int(round(sender.value))
		valueLabel.text = "$\(x)"
		let point = setUISliderThumbValueWithLabel(slider: sender)
		print("[MLBS] - sliderAction: \(sender.value)")
		self.valueLabelLeadingConstraint.constant = point.x
//		self.sliderDelegate?.onSliderAmmountChange(value: Int(sender.value))

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

extension AndesSliderAbstractView {

	func setUISliderThumbValueWithLabel(slider: UISlider) -> CGPoint {
		let slidertTrack: CGRect = slider.trackRect(forBounds: slider.bounds)
		let sliderThumbFrame: CGRect = slider.thumbRect(forBounds: slider.bounds, trackRect: slidertTrack, value: slider.value)
		let point = CGPoint(x: sliderThumbFrame.origin.x + sliderThumbFrame.width/2 - self.valueLabel.frame.width / 2, y: valueLabel.center.y)
		debugPrint("[AndesUI] - slidertTrack: \(slidertTrack)")
		debugPrint("[AndesUI] - sliderFrame: \(sliderThumbFrame)")
		debugPrint("[AndesUI] - point? \(point)")
		debugPrint("[AndesUI] - self.sliderLabel.frame.width / 2: \(self.valueLabel.frame.width / 2)")
		return point
	}

//	func setToolTipValueWithLabel(slider: UISlider) -> CGPoint {
//
//	}
}
