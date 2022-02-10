//
//  ColorSettingViewController.swift
//  colorSettingHW6
//
//  Created by Денис Вареников on 10.02.2022.
//

import UIKit

class ColorSettingViewController: UIViewController {


    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    
    @IBOutlet var colorWindow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelRed.text = String(format: "%.2f", sliderRed.value)
        labelGreen.text = String(format: "%.2f", sliderGreen.value)
        labelBlue.text = String(format: "%.2f", sliderBlue.value)
        
        redTF.text = String(format: "%.2f", sliderRed.value)
        greenTF.text = String(format: "%.2f", sliderGreen.value)
        blueTF.text = String(format: "%.2f", sliderBlue.value)
        
        colorWindow.layer.cornerRadius = 10
        setColor()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        switch sender {
        case sliderRed:
            labelRed.text = String(format: "%.2f", sliderRed.value)
            redTF.text = String(format: "%.2f", sliderRed.value)
        case sliderGreen:
            labelGreen.text = String(format: "%.2f", sliderGreen.value)
            greenTF.text = String(format: "%.2f", sliderGreen.value)
        default:
            labelBlue.text = String(format: "%.2f", sliderBlue.value)
            blueTF.text = String(format: "%.2f", sliderBlue.value)
        }
        
        setColor()
    }
      

}

extension ColorSettingViewController {
    private func setColor() {
        colorWindow.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1)
    }
}
