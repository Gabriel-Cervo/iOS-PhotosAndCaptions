//
//  ViewController.swift
//  PhotosAndCaptions
//
//  Created by Joao Gabriel Dourado Cervo on 28/02/21.
//

import UIKit

class ViewController: UITableViewController {
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }


}

