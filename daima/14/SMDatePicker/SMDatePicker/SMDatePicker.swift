//
//  SMDatePicker.swift
//  Countapp


import UIKit

@objc public protocol SMDatePickerDelegate {
    
    @objc optional func datePickerWillAppear(_ picker: SMDatePicker)
    @objc optional func datePickerDidAppear(_ picker: SMDatePicker)
    
    @objc optional func datePicker(_ picker: SMDatePicker, didPickDate date: Date)
    @objc optional func datePickerDidCancel(_ picker: SMDatePicker)
    
    @objc optional func datePickerWillDisappear(_ picker: SMDatePicker)
    @objc optional func datePickerDidDisappear(_ picker: SMDatePicker)
    
}

@objc public class SMDatePicker: UIView {
    
    /** Picker's delegate that conforms to SMDatePickerDelegate protocol */
    public var delegate: SMDatePickerDelegate?
    
    /** UIToolbar title */
    public var title: String?
    public var titleFont: UIFont = UIFont.systemFont(ofSize: 13)
    public var titleColor: UIColor = UIColor.gray()
    
    /** You can define your own toolbar height. By default it's 44 pixels. */
    public var toolbarHeight: CGFloat = 44.0
    
    /** Specify different UIDatePicker mode. By default it's UIDatePickerMode.DateAndTime */
    public var pickerMode: UIDatePickerMode = UIDatePickerMode.dateAndTime {
        didSet { picker.datePickerMode = pickerMode }
    }
    
    /** You can set up different color for picker and toolbar. */
    public var toolbarBackgroundColor: UIColor? {
        didSet {
            toolbar.backgroundColor = toolbarBackgroundColor
            toolbar.barTintColor = toolbarBackgroundColor
        }
    }
    
    /** You can set up different color for picker and toolbar. */
    public var pickerBackgroundColor: UIColor? {
        didSet { picker.backgroundColor = pickerBackgroundColor }
    }
    
    /** Initial picker's date */
    public var pickerDate: Date = Date() {
        didSet { picker.date = pickerDate }
    }
    
    /** Array of UIBarButtonItem's that will be placed on left side of UIToolbar. By default it has only 'Cancel' bytton. */
    public var leftButtons: [UIBarButtonItem] = []
    
    /** Array of UIBarButtonItem's that will be placed on right side of UIToolbar. By default it has only 'Done' bytton. */
    public var rightButtons: [UIBarButtonItem] = []
    
    // Privates
    
    private var toolbar: UIToolbar = UIToolbar()
    private var picker: UIDatePicker = UIDatePicker()
    
    // MARK: Lifecycle
    
    public override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        addSubview(picker)
        addSubview(toolbar)
        
        setupDefaultButtons()
        customize()
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        addSubview(picker)
        addSubview(toolbar)
        
        setupDefaultButtons()
        customize()
    }
    
    // MARK: Customization
    
    private func setupDefaultButtons() {
        let doneButton = UIBarButtonItem(title: "Done",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(SMDatePicker.pressedDone(_:)))

        let cancelButton = UIBarButtonItem(title: "Cancel",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(SMDatePicker.pressedCancel(_:)))
        
        leftButtons = [ cancelButton ]
        rightButtons = [ doneButton ]
    }
    
    private func customize() {
        toolbar.barStyle = UIBarStyle.blackTranslucent
        toolbar.isTranslucent = false
        
        backgroundColor = UIColor.white()
        
        if let toolbarBackgroundColor = toolbarBackgroundColor {
            toolbar.backgroundColor = toolbarBackgroundColor
        } else {
            toolbar.backgroundColor = backgroundColor
        }
        
        if let pickerBackgroundColor = pickerBackgroundColor {
            picker.backgroundColor = pickerBackgroundColor
        } else {
            picker.backgroundColor = backgroundColor
        }
    }
    
    private func toolbarItems() -> [UIBarButtonItem] {
        var items: [UIBarButtonItem] = []
        
        for button in leftButtons {
            items.append(button)
        }
        
        if let title = toolbarTitle() {
            let spaceLeft = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            let spaceRight = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            let titleItem = UIBarButtonItem(customView: title)
            
            items.append(spaceLeft)
            items.append(titleItem)
            items.append(spaceRight)
        } else {
            let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            items.append(space)
        }
        
        for button in rightButtons {
            items.append(button)
        }
        
        return items
    }
    
    private func toolbarTitle() -> UILabel? {
        if let title = title {
            let label = UILabel()
            label.text = title
            label.font = titleFont
            label.textColor = titleColor
            label.sizeToFit()
            
            return label
        }
        
        return nil
    }
    
    // MARK: Showing and hiding picker
    
    /**
    Shows picker in view with animation if it's required.
    
    - parameter view: is a UIView where we want to show our picker
    - parameter animated: will show with animation if it's true
    
    */
    public func showPickerInView(_ view: UIView, animated: Bool) {
        toolbar.items = toolbarItems()
        
        toolbar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: toolbarHeight)
        picker.frame = CGRect(x: 0, y: toolbarHeight, width: view.frame.size.width, height: picker.frame.size.height)
        self.frame = CGRect(x: 0, y: view.frame.size.height - picker.frame.size.height - toolbar.frame.size.height,
            width: view.frame.size.width, height: picker.frame.size.height + toolbar.frame.size.height)

        view.addSubview(self)
        becomeFirstResponder()
        
        showPickerAnimation(animated)
    }
    
    /**
    Hide visible picker anikmated. 

    - parameter animated: will hide with animation if `true`
    */
    public func hidePicker(_ animated: Bool) {
        hidePickerAnimation(true)
    }
    
    // MARK: Animation
    
    private func hidePickerAnimation(_ animated: Bool) {
        delegate?.datePickerWillDisappear?(self)
        
        if animated {
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.frame = self.frame.offsetBy(dx: 0, dy: self.picker.frame.size.height + self.toolbar.frame.size.height)
            }) { (finished) -> Void in
                self.delegate?.datePickerDidDisappear?(self)
            }
        } else {
            self.frame = self.frame.offsetBy(dx: 0, dy: self.picker.frame.size.height + self.toolbar.frame.size.height)
            delegate?.datePickerDidDisappear?(self)
        }
    }
    
    private func showPickerAnimation(_ animated: Bool) {
        delegate?.datePickerWillAppear?(self)
        
        if animated {
            self.frame = self.frame.offsetBy(dx: 0, dy: self.frame.size.height)
            
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.frame = self.frame.offsetBy(dx: 0, dy: -1 * self.frame.size.height)
            }) { (finished) -> Void in
                self.delegate?.datePickerDidAppear?(self)
            }
        } else {
            delegate?.datePickerDidAppear?(self)
        }
    }
    
    // MARK: Actions
    
    /**
    Default Done action for picker. It will hide picker with animation and call's delegate datePicker(:didPickDate) method.
    */
    public func pressedDone(_ sender: AnyObject) {
        hidePickerAnimation(true)
        
        delegate?.datePicker?(self, didPickDate: picker.date)
    }
    
    /**
    Default Cancel actions for picker.
    */
    public func pressedCancel(_ sender: AnyObject) {
        hidePickerAnimation(true)
        
        delegate?.datePickerDidCancel?(self)
    }

}
