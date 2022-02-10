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
    
    var colorRGB: [String: CGFloat]!
    var delegate: ColorSettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorRed = colorRGB["red"] ?? 0
        let colorGreen = colorRGB["green"] ?? 0
        let colorBlue = colorRGB["blue"] ?? 0
                
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        redTF.returnKeyType = .next
        greenTF.returnKeyType = .next
        blueTF.returnKeyType = .done
        
        colorWindow.layer.cornerRadius = 10
        
        updatingElementValues(
            red: Float(colorRed),
            green: Float(colorGreen),
            blue: Float(colorBlue))
        
        setColor(red: colorRed, green: colorGreen, blue: colorBlue)
        
        addTapGestureToHideKeyboard()
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
      
    @IBAction func doneAction() {
        view.endEditing(true)
        
        let colorRGB = [
            "red": CGFloat(sliderRed.value),
            "green": CGFloat(sliderGreen.value),
            "blue": CGFloat(sliderBlue.value)]
        
        delegate.setBackgroundColor(for: colorRGB)
        dismiss(animated: true)
    }
    
}

// MARK: - Private Methods
extension ColorSettingViewController {
    private func setColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorWindow.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1)
    }
    
    private func updatingElementValues(red: Float, green: Float, blue: Float) {
        labelRed.text = String(format: "%.2f", red)
        labelGreen.text = String(format: "%.2f", green)
        labelBlue.text = String(format: "%.2f", blue)
        
        redTF.text = String(format: "%.2f", red)
        greenTF.text = String(format: "%.2f", green)
        blueTF.text = String(format: "%.2f", blue)
        
        sliderRed.value = red
        sliderGreen.value = green
        sliderBlue.value = blue
    }
    
    private func updateColor() {
        guard let newColorRed = redTF.text else { return }
        guard let newColorGreen = greenTF.text else { return }
        guard let newColorBlue = blueTF.text else { return }
        
        if let colorRed = Float(newColorRed),
           let colorGreen = Float(newColorGreen),
           let colorBlue = Float(newColorBlue) {
            if colorRed <= 1.00
                && colorRed >= 0.00
                && colorGreen <= 1.00
                && colorGreen >= 0.00
                && colorBlue <= 1.00
                && colorBlue >= 0.00 {
                
                updatingElementValues(red: colorRed, green: colorGreen, blue: colorBlue)
      
                setColor(
                    red: CGFloat(colorRed),
                    green: CGFloat(colorGreen),
                    blue: CGFloat(colorBlue))
            } else { showAlert(
                title: "Ошибка",
                massage: "Введите корректно данные") }
        } else { showAlert(
            title: "Ошибка",
            massage: "Введите корректно данные") }
    }
}

// MARK: - Keyboard Methods
extension ColorSettingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateColor()
        
        if textField == redTF {
            greenTF.becomeFirstResponder()
        } else if textField == greenTF {
            blueTF.becomeFirstResponder()
        } else if textField == blueTF {
            doneAction()
        }
        return true
    }
    
    private func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(
            target: view,
            action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Private Methods Alert
extension ColorSettingViewController {
    private func showAlert(title: String, massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)

        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
