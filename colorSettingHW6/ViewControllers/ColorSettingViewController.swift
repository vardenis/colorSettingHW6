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
    
    var colorRGB = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorRed = colorRGB[0]
        let colorGreen = colorRGB[1]
        let colorBlue = colorRGB[2]
        
        labelRed.text = String(format: "%.2f", colorRed)
        labelGreen.text = String(format: "%.2f", colorGreen)
        labelBlue.text = String(format: "%.2f", colorBlue)
        
        redTF.text = String(format: "%.2f", colorRed)
        greenTF.text = String(format: "%.2f", colorGreen)
        blueTF.text = String(format: "%.2f", colorBlue)
        
        colorWindow.layer.cornerRadius = 10
        setColor(red: colorRed, green: colorGreen, blue: colorBlue)
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
        
        setColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value))
    }
      

}

extension ColorSettingViewController {
    private func setColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorWindow.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1)
    }
}
