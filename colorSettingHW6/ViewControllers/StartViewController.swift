//
//  StartViewController.swift
//  colorSettingHW6
//
//  Created by Денис Вареников on 10.02.2022.
//

import UIKit

/*protocol ColorSettingViewControllerDelegate {
    func setBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat)
    
}*/

class StartViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingVC = segue.destination as? ColorSettingViewController else { return }
        
        let colorView = CIColor(color: view.backgroundColor ?? UIColor.systemBackground)
        let colorRGB = [colorView.red, colorView.green, colorView.blue]
        
        colorSettingVC.colorRGB = colorRGB
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
    }

}

/*extension StartViewController: ColorSettingViewControllerDelegate {
    func setBackgroundColor(red: CGFloat, green: CGFloat) {
        <#code#>
    }
    
    
}*/
