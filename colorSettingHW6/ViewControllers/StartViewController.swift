//
//  StartViewController.swift
//  colorSettingHW6
//
//  Created by Денис Вареников on 10.02.2022.
//

import UIKit

protocol ColorSettingViewControllerDelegate {
    func setBackgroundColor(for colorRGB: [String: CGFloat])
    
}

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingVC = segue.destination as? ColorSettingViewController else { return }
        let colorView = CIColor(color: view.backgroundColor  ?? UIColor.systemBackground)
        let colorRGB = [
            "red": colorView.red,
            "green": colorView.green,
            "blue": colorView.blue]
    
        colorSettingVC.colorRGB = colorRGB
        colorSettingVC.delegate = self
    }

}

extension StartViewController: ColorSettingViewControllerDelegate {    
    func setBackgroundColor(for colorRGB: [String: CGFloat]) {
        view.backgroundColor = UIColor(
            red: colorRGB["red"] ?? 0,
            green: colorRGB["green"] ?? 0,
            blue: colorRGB["blue"] ?? 0,
            alpha: 1)
    }
    
    
}
