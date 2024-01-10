//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by kanagasabapathy on 10/01/24.
//

import UIKit

class ViewController: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Dynamic Text"
        label.backgroundColor = .red
        label.numberOfLines = 0
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Press Me", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "github-square.jpg"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    func setupView() {
        view.backgroundColor = .white
        // marked views - translatesAutoresizingMaskIntoConstraints = false
        view.addSubViews([label, button, imageView])
        setupConstraints()
    }

    func setupConstraints() {
        // center the label horizantally and vertically
        label.anchorCenter(centerX: view.centerXAnchor, centerY: view.centerYAnchor)

        // Position button below Label with spacing
        button.anchor(top: label.bottomAnchor, inset: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        button.anchorCenter(centerX: view.centerXAnchor)

        // Position the image view below the button with spacing
        imageView.anchor(top: button.bottomAnchor, inset: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        imageView.anchorCenter(centerX: view.centerXAnchor)

        // Set a maximum width for all views
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            button.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 300)
        ])

        // Priority adjustments
        // Content hugging priorities
        label.setContentHuggingPriority(.required, for: .vertical)
        button.setContentHuggingPriority(.defaultHigh, for: .vertical)
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)

        // Content compression resistance priorities
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        button.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)

        // Multiplier example: Make the button's height half of the label's height

        // MARK: without UIView+Extensions
        // button.heightAnchor.constraint(equalTo: label.heightAnchor, multiplier: 0.5)

        button.anchorDimension(height: label.heightAnchor,
                               inset: UIEdgeInsets(top: 0.5, left: 0, bottom: 0, right: 0))

        // Aspect ratio for the image view
        // MARK: without UIView+Extensions
        // imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0),

        imageView.anchorDimension(width: imageView.heightAnchor,
                                  inset: UIEdgeInsets(top: 0, left: 1.0, bottom: 0, right: 0))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
}
