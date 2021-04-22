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
	@IBOutlet weak var valueLabel: UILabel!
	@IBOutlet weak var tooltipBackgroundView: UIView!

	@IBOutlet weak var tooltipLeadingConstraint: NSLayoutConstraint!
	@IBOutlet weak var valueLabelLeadingConstraint: NSLayoutConstraint!

	let tooltipLabel: UILabel = {
		let label = UILabel()
		label.text = "$ 0"
		label.contentMode = .center
		label.numberOfLines = 0
		label.setAndesStyle(style: AndesFontStyle(textColor: AndesStyleSheetManager.styleSheet.textColorWhite, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14), lineSpacing: 0))
		return label
	}()

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
		let valuePoint = setSliderThumbValueWithLabel(slider: self.sliderView)
		let tooltipPoint = setSliderValueForTooltip(slider: self.sliderView)
		self.valueLabelLeadingConstraint.constant = valuePoint.x
		self.tooltipLeadingConstraint.constant = tooltipPoint.x
		super.layoutSubviews()
	}

	@IBAction func sliderAction(_ sender: UISlider) {
		let amount = Int(sender.value.rounded())
		valueLabel.text = "$\(amount)"
		tooltipLabel.text = "$\(amount)"
		let valueLabelPoint = setSliderThumbValueWithLabel(slider: sender)
		let tooltipPoint = setSliderValueForTooltip(slider: sender)

		print("[AndesSlider] - sliderAction: \(sender.value.rounded())")
		print("[AndesSlider] - sliderAction-valueLabelPoint \(valueLabelPoint)")
		print("[AndesSlider] - sliderAction-tooltipLabelPoint: \(tooltipPoint)")

		self.valueLabelLeadingConstraint.constant = valueLabelPoint.x
		self.tooltipLeadingConstraint.constant = tooltipPoint.x
		self.delegate?.onValueChanged(value: Double(amount))
		self.setHandleBehaviour()

	}

	@objc fileprivate func setHandleBehaviour() {

		if sliderView.isHighlighted {
			self.tooltipBackgroundView.isHidden = false
			self.valueLabel.isHidden = true
		} else if !sliderView.isHighlighted {
			self.tooltipBackgroundView.isHidden = true
			self.valueLabel.isHidden = false
		}
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
		setupTooltipBackgroundView()
		self.tooltipBackgroundView.isHidden = true
		self.sliderView.addTarget(self, action: #selector(self.setHandleBehaviour), for: [.allTouchEvents])
    }

	func setupTooltipBackgroundView() {
		self.tooltipBackgroundView.backgroundColor = UIColor.Andes.gray800
		self.tooltipBackgroundView.layer.cornerRadius = 5
		self.tooltipBackgroundView.contentMode = .center

		setupTooltipLabel()
	}

	func setupTooltipLabel() {
		self.tooltipBackgroundView.addSubview(self.tooltipLabel)
		self.tooltipLabel.translatesAutoresizingMaskIntoConstraints = false
		self.tooltipLabel.centerYAnchor.constraint(equalTo: self.tooltipBackgroundView.centerYAnchor).isActive = true
		self.tooltipLabel.centerXAnchor.constraint(equalTo: self.tooltipBackgroundView.centerXAnchor).isActive = true
	}

	func setupSliderColor() {

		self.sliderView.minimumTrackTintColor = UIColor.Andes.gray070
		self.sliderView.maximumTrackTintColor = UIColor.Andes.gray070
	}

    func updateView() {
		self.valueLabel.text = "$\(sliderView.value.rounded())"
		self.tooltipLabel.text = "$\(sliderView.value.rounded())"
		self.sliderView.minimumValue = Float(self.config.minValue)
		self.sliderView.maximumValue = Float(self.config.maxValue)
    }

	func setThumbImage() {

		let normal = UIImage(named: "sliderBlueThumb", in: AndesBundle.bundle(), compatibleWith: nil)
		let highlighted = UIImage(named: "sliderGrayThumb", in: AndesBundle.bundle(), compatibleWith: nil)
		self.sliderView.setThumbImage(normal, for: .normal)
		self.sliderView.setThumbImage(highlighted, for: .highlighted)
	}
}

extension AndesSliderAbstractView {

	fileprivate func setSliderThumbValueWithLabel(slider: UISlider) -> CGPoint {

		let slidertTrack: CGRect = slider.trackRect(forBounds: slider.bounds)
		let sliderThumbFrame: CGRect = slider.thumbRect(forBounds: slider.bounds, trackRect: slidertTrack, value: slider.value)
		let xValue: CGFloat = (sliderThumbFrame.origin.x + sliderThumbFrame.width/2 - self.valueLabel.frame.width/2).rounded(.up)
		let point = CGPoint(x: xValue, y: self.valueLabel.center.y)
		debugPrint("[AndesUI] - point \(point)")
		return point
	}

	fileprivate func setSliderValueForTooltip(slider: UISlider) -> CGPoint {
		let sliderTrack: CGRect = slider.trackRect(forBounds: slider.bounds)
		let sliderThumbFrame: CGRect = slider.thumbRect(forBounds: slider.bounds, trackRect: sliderTrack, value: slider.value)
		let point = CGPoint(x: sliderThumbFrame.origin.x + sliderThumbFrame.width/2 - self.tooltipLabel.frame.width / 2, y: self.tooltipLabel.center.y)
		return point
	}

}
