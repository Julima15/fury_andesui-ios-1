//
//  
//  AndesSlider.swift
//  AndesUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import Foundation

@objc public class AndesSlider: UIView {
    internal var contentView: AndesSliderView!

    @objc public var type: AndesSliderType = .success {
        didSet {
            updateContentView()
        }
    }

    @objc public var hierarchy: AndesSliderHierarchy = .loud {
        didSet {
            updateContentView()
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

    @objc public init(type: AndesSliderType) {
        super.init(frame: .zero)
        self.type = type
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
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
        let config = AndesSliderViewConfigFactory.provideInternalConfig(type: self.type, hierarchy: self.hierarchy)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> AndesSliderView {
        let config = AndesSliderViewConfigFactory.provideInternalConfig(type: self.type, hierarchy: self.hierarchy)
        return AndesSliderViewDefault(withConfig: config)
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

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'hierarchy' instead.")
    @IBInspectable var ibHierarchy: String {
        set(val) {
            self.hierarchy = AndesSliderHierarchy.checkValidEnum(property: "IB hierarchy", key: val)
        }
        get {
            return self.hierarchy.toString()
        }
    }
}
