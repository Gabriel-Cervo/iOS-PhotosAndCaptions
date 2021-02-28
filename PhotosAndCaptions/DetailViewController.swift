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
        
        let imageView = UIImageView(image: UIImage(contentsOfFile: imageURL.path))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        imageView.layer.cornerRadius = 5
        
        view.addSubview(imageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
