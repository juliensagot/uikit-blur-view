//
//  ViewController.swift
//  DemoApp
//
//  Created by Julien Sagot on 09/11/2024.
//

import BlurView
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    view.backgroundColor = .black
    
    let blurView = BlurView()
    blurView.blurRadius = 10
    blurView.translatesAutoresizingMaskIntoConstraints = false
    
    let label = UILabel()
    label.text = "🌚"
    label.font = UIFont.systemFont(ofSize: 110)
    label.alpha = 0
    label.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    blurView.addSubview(label)
    view.addSubview(blurView)
    
    let animateInButton = UIButton(
      type: .system,
      primaryAction: UIAction(title: "Animate In") { [weak blurView, weak label]_ in
        UIView.animate(withDuration: 1) {
          blurView?.blurRadius = 0
          label?.alpha = 1
          label?.transform = .identity
        }
      }
    )
    
    let animateOutButton = UIButton(
      type: .system,
      primaryAction: UIAction(title: "Animate Out") { [weak blurView, weak label]_ in
        UIView.animate(withDuration: 1) {
          blurView?.blurRadius = 10
          label?.alpha = 0
          label?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
      }
    )
    
    let controlsStackView = UIStackView(arrangedSubviews: [animateInButton, animateOutButton])
    controlsStackView.spacing = 32
    controlsStackView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(controlsStackView)
    
    NSLayoutConstraint.activate([
      blurView.topAnchor.constraint(equalTo: view.topAnchor),
      blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      label.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
      
      controlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      controlsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
}

@available(iOS 17.0, *)
#Preview {
  ViewController()
}
