//
//  ViewController.swift
//  RandomAnimation
//
//  Created by Vasiliy on 06.08.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {

    @IBOutlet var animationLabel: UILabel!
    @IBOutlet var animationView: SpringView!
    @IBOutlet var animationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 10
        animationButton.layer.cornerRadius = 10
    }

    @IBAction func animationButtonPressed(_ sender: SpringButton) {
    
        animationView.animation = "\(getRandomPreset())"
        animationView.curve = "\(getRandomCurve())"
        animationView.animate()

        animationLabel.text = " preset: \(animationView.animation)\n curve: \(animationView.curve)\n forse: \(animationView.force)\n duration: \(animationView.duration)\n delay: \(animationView.delay)"

    }
}
extension ViewController {
    func getRandomPreset() -> String {
        var presetAnimations: [String] = []
        for animation in AnimationPreset.allCases {
            presetAnimations.append(animation.rawValue)
        }
        let preset = presetAnimations.randomElement() ?? ""
        return preset
    }

    func getRandomCurve() -> String {
        var curveAnimations: [String] = []
        for curve in AnimationCurve.allCases {
            curveAnimations.append(curve.rawValue)
        }
        let curve = curveAnimations.randomElement() ?? ""
        return curve
    }


}
