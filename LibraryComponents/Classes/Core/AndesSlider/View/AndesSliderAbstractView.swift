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

    @IBOutlet weak var componentView: UIView!
	@IBOutlet weak var sliderView: UISlider!
	@IBOutlet weak var toolTipLabel: UILabel!
	@IBOutlet weak var valueLabel: UILabel!

	@IBOutlet weak var valueLabelLeadingConstraint: NSLayoutConstraint!
	@IBOutlet weak var toolTipLabelLeadingConstraint: NSLayoutConstraint!

	override func awakeFromNib() {
		super.awakeFromNib()

		let sliderValue = Int(config.minValue.rounded())
		self.sliderView.value = Float(sliderValue)
	}

	weak var delegate: AndesSliderViewDelegate?
    var config: AndesSliderViewConfig

	init(withConfig config: AndesSliderViewConfig, delegate: AndesSliderViewDelegate) {
        self.config = config
		self.delegate = delegate
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
		let bundle = AndesBundle.bundle()
		bundle.loadNibNamed("AndesSliderViewDefault", owner: self, options: nil)
    }

	override init(frame: CGRect) {
		self.config = AndesSliderViewConfig()
		super.init(frame: frame)
		setup()
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		self.componentView.layoutIfNeeded()
		let point = setUISliderThumbValueWithLabel(slider: self.sliderView)
		self.valueLabelLeadingConstraint.constant = point.x
		super.layoutSubviews()
	}

	@IBAction func sliderAction(_ sender: UISlider) {
		let amount = Int(sender.value.rounded())
		valueLabel.text = "$\(amount)"
		toolTipLabel.text = "$\(amount)"
		let point = setUISliderThumbValueWithLabel(slider: sender)
		print("[AndesSlider] - sliderAction: \(sender.value.rounded())")
		self.valueLabelLeadingConstraint.constant = point.x
		self.toolTipLabelLeadingConstraint.constant = point.x
		self.delegate?.onValueChanged(value: Double(amount))
		self.setThumbImage()

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
		setupSliderColor()
		setThumbImage()

    }

	func setupSliderColor() {
		self.sliderView.minimumTrackTintColor = UIColor.Andes.gray070
		self.sliderView.maximumTrackTintColor = UIColor.Andes.gray070
	}

    /// Override this method on each Badge View to setup its unique components

    func updateView() {
		self.valueLabel.text = "$\(sliderView.value.rounded())"
		self.toolTipLabel.text = "$\(sliderView.value.rounded())"

		self.sliderView.minimumValue = Float(self.config.minValue)
		self.sliderView.maximumValue = Float(self.config.maxValue)
    }

	func setThumbImage() {

		let normal = UIImage(named: "sliderBlueThumb", in: AndesBundle.bundle(), compatibleWith: nil)
//		sliderView.setThumbImage(normal, for: .normal)
		let highlighted = UIImage(named: "sliderGrayThumb", in: AndesBundle.bundle(), compatibleWith: nil)
//		sliderView.setThumbImage(highlighted, for: .highlighted)
		self.sliderView.setThumbImage(normal, for: .normal)
		self.sliderView.setThumbImage(highlighted, for: .highlighted)
	}
}

extension AndesSliderAbstractView {

	fileprivate func setUISliderThumbValueWithLabel(slider: UISlider) -> CGPoint {

		let slidertTrack: CGRect = slider.trackRect(forBounds: slider.bounds)
		let sliderThumbFrame: CGRect = slider.thumbRect(forBounds: slider.bounds, trackRect: slidertTrack, value: slider.value)
		let point = CGPoint(x: sliderThumbFrame.origin.x + sliderThumbFrame.width/2 - self.valueLabel.frame.width / 2, y: valueLabel.center.y)
		debugPrint("[AndesUI] - slidertTrack: \(slidertTrack)")
		debugPrint("[AndesUI] - sliderFrame: \(sliderThumbFrame)")
		debugPrint("[AndesUI] - point \(point)")
		debugPrint("[AndesUI] - self.sliderLabel.frame.width / 2: \(self.valueLabel.frame.width / 2)")
		return point
	}

	fileprivate func setSliderValueForTooltip(slider: UISlider) -> CGPoint {
		let sliderTrack: CGRect = slider.trackRect(forBounds: slider.bounds)
		let sliderThumbFrame: CGRect = slider.thumbRect(forBounds: slider.bounds, trackRect: sliderTrack, value: slider.value)
		let point = CGPoint(x: sliderThumbFrame.origin.x + sliderThumbFrame.width/2 - self.toolTipLabel.frame.width / 2, y: self.toolTipLabel.center.y)
		return point
	}
}
