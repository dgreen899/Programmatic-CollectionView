//
//  ViewController.swift
//  ProgrammaticCollectionView
//
//  Created by Dameon Green on 8/17/17.
//  Copyright © 2017 ApptasticVoyage. All rights reserved.
//

import UIKit

class MyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let customCellIdentifier = "customCellIdentifier"
    
    
    let names = ["New York", "Los Angeles", "Chicago"]
    let photos = ["ny1.jpg", "LA.jpg", "chicago.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        view.backgroundColor = UIColor.red
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customCellIdentifier)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return names.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! CustomCell
        customCell.nameLabel.text = names[indexPath.item]
        customCell.bgImage.image = photos[indexPath.item]
        
        return customCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200.0)
    }
}

class CustomCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        
    return label
    }()
    
//    let image: UIImage = UIImage(named: "LA.jpg")!
//    let bgImage:UIImageView = {
//        let imageView = UIImageView(image: image)
//        imageView.frame = CGRect(0,0, self.frame.width.bounds, self.frame.height.bounds)
//}()
    
    var bgImage : UIImageView = {
    
        let bgImage = UIImageView(frame:CGRect(x:0,y: 0, width:self.view.frame.bounds.width, height:self.view.frame.bounds.height))
    bgImage.image = UIImage(named:"image.jpg")
    self.view.addSubview(bgImage)
    bgImage.translatesAutoresizingMaskIntoConstraints = false
        

    }()


    func setupViews() {
        backgroundColor = UIColor.red
        
        addSubview(nameLabel)
        addSubview(bgImage)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        //constrainst for imageView
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": bgImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": bgImage]))
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

