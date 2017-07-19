//
//  ViewController.swift
//  CollectionView
//
//  Created by NareshNaidu on 03/07/17.
//  Copyright © 2017 NareshNaidu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imgurs = [Imgur]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingSerivce.shared.getImgurs { (response) in
            self.imgurs = response.imgurs
            self.collectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgurs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgurCell", for: indexPath) as? imgurCell else { return UICollectionViewCell() }
        cell.configure(with: imgurs[indexPath.item])
        return cell
    }
}

