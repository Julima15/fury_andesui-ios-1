//
//  
//  AndesSlider.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import UIKit

@objc public class AndesSlider: UIView {
    internal var contentView: AndesSliderView!

	// MARK: - User properties

    @objc public var type: AndesSliderType = .simple {
        didSet {
            updateContentView()
        }
    }

//	@objc public var valueLable: Int
	@objc public var sliderLimits: AndesSliderLimit?

	@objc public var leftIcon: String? {
		didSet {
			updateContentView()
		}
	}
	@objc public var rightIcon: String? {
		didSet {
			updateContentView()
		}
	}

	// MARK: - Slider's Limit Values
	@objc public var sliderMinValue: NSNumber? {
		didSet {
			updateContentView()
		}
	}
	@objc public var sliderMaxValue: NSNumber? {
		didSet {
			updateContentView()
		}
	}

	// the current state of the slider
	@objc public var state: AndesSliderState = .idle {
		didSet {
			self.updateContentView()
		}
	}

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

	@objc public init(type: AndesSliderType, minValue: Double, maxValue: Double) {
        super.init(frame: .zero)
        self.type = type
		// set config
        setup()
    }

	// MARK: - Content View Setup

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
		let config = AndesSliderViewConfig(for: self)
		contentView = AndesSliderAbstractView(withConfig: config, delegate: self)
		self.addSubview(contentView)
		contentView.pinToSuperview()
		self.sliderMinValue = NSNumber(value: config.minValue)
		self.sliderMaxValue = NSNumber(value: config.maxValue)
//        drawContentView(with: provideView())
    }

    private func drawContentView(with newView: AndesSliderView) {
        self.contentView = newView
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        }
        updateContentView()
    }

    private func updateContentView() {
		let config = AndesSliderViewConfig(for: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> AndesSliderView {
		let config = AndesSliderViewConfig(for: self)
		return AndesSliderViewDefault(withConfig: config, delegate: self)
    }
}

extension AndesSlider: AndesSliderViewDelegate {
	func onValueChanged(value: Double) {
		debugPrint("[AndesSlider] - AndesSliderViewDelegate value changed")
	}
}

// MARK: - IB interface
public extension AndesSlider {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = AndesSliderType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }
}
