//
//  ViewController.swift
//  PhotosAndCaptions
//
//  Created by Joao Gabriel Dourado Cervo on 28/02/21.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPhoto))
    }
    
    //MARK: ImagePicker Methods
    @objc func addNewPhoto() {
        let picker = UIImagePickerController()

        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString // generate a random name for the image
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        guard let jpegData = image.jpegData(compressionQuality: 0.8) else {
            print("Cannot transform jpeg in data")
            return
        }
        
        try? jpegData.write(to: imagePath) // Save image in the url

        let photo = Photo(image: imageName, description: "Photo")
        photos.append(photo)
        
        tableView.reloadData()
        
        dismiss(animated: true)
    }
    
    //MARK: TableView Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let photoCell = tableView.dequeueReusableCell(withIdentifier: "Photo", for: indexPath) as? PhotoTableViewCell else {
            fatalError("Can't dequeue the table cell")
        }
        
        let photo = photos[indexPath.row]
        
        let imageURL = getDocumentsDirectory().appendingPathComponent(photo.image)
        photoCell.photoImageView.image = UIImage(contentsOfFile: imageURL.path)
        photoCell.photoDescription.text = photo.description
        
        photoCell.imageView?.layer.borderWidth = 2
        photoCell.imageView?.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        
        
        return photoCell
    }


}

