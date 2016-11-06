//  CircularSliderView
//
//  Created by Samrez Ikram on 11/5/16.
//  Copyright © 2016 Samrez Ikram. All rights reserved.
//

import UIKit

@IBDesignable class CircularSliderView: UIView {
    
    @IBInspectable var startColor:UIColor = UIColor.red
    @IBInspectable var endColor:UIColor = UIColor.blue
    
    #if TARGET_INTERFACE_BUILDER
    override func willMoveToSuperview(newSuperview: UIView?) {
    
    let slider:CircularSlider = CircularSlider(startColor:self.startColor, endColor:self.endColor, frame: self.bounds)
    self.addSubview(slider)
    
    }
    
    #else
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Build the slider
        let slider:CircularSlider = CircularSlider(startColor:self.startColor, endColor:self.endColor, frame: self.bounds)
        
        // Attach an Action and a Target to the slider
        slider.addTarget(self, action: #selector(CircularSliderView.valueChanged(slider:)), for: UIControlEvents.valueChanged)
        
        // Add the slider as subview of this view
        self.addSubview(slider)
        
    }
    #endif
    
    func valueChanged(slider:CircularSlider){
        // Do something with the value...
        print("Value changed \(slider.angle)")
    }
}
