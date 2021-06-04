//
//  ColorViewController.swift
//  TestAppForAbramov
//
//  Created by Антон Бушманов on 04.06.2021.
//

import UIKit

class ColorViewController: UIViewController {
    @IBOutlet weak var viewForColor: UIView!
    var colorForView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if colorForView != nil {        
            viewForColor.layer.backgroundColor = colorForView.cgColor
        }
    }
}
