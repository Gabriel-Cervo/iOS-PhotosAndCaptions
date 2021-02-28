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
        view.backgroundColor = .white
                
        let imageURL = getDocumentsDirectory().appendingPathComponent(imageName!)
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(contentsOfFile: imageURL.path)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        imageView.layer.cornerRadius = view.frame.size.width / 2
        view.addSubview(imageView)
        
        let labelView = UILabel()
        labelView.text = imageDescription
        labelView.font = .systemFont(ofSize: 16)
        labelView.tintColor = .black
        view.addSubview(labelView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3),
            imageView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: 100),
            
//            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(imageDescription!)
    }
}
