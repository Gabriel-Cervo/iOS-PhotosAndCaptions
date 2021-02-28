//
//  DetailViewController.swift
//  PhotosAndCaptions
//
//  Created by Joao Gabriel Dourado Cervo on 28/02/21.
//

import UIKit

class DetailViewController: UIViewController {
    var imageName: String?
    var imageDescription: String?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .black
                
        let imageURL = getDocumentsDirectory().appendingPathComponent(imageName!)
        
        let imageView = UIImageView(image: UIImage(contentsOfFile: imageURL.path))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor(white: 1.0, alpha: 0.5).cgColor
        imageView.layer.cornerRadius = view.frame.size.width / 2
        view.addSubview(imageView)
        
        let labelView = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = imageDescription!
        labelView.font = .systemFont(ofSize: 16)
        labelView.tintColor = .white
        view.addSubview(labelView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            imageView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3),
            imageView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            labelView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            labelView.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
