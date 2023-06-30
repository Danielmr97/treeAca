//
//  Home.swift
//  TreeAcademy
//
//  Created by Daniel Mayo on 06/01/23.
//

import Foundation
import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var ColectionHome: UICollectionView!
    @IBOutlet weak var TableHome: UITableView!
    
    private let sujerencias = ["hola","como"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ColectionHome.dataSource = self
        ColectionHome.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "colecimage")
    }

    
}

extension HomeController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ColectionHome.dequeueReusableCell(withReuseIdentifier: "colecimage", for: indexPath) as? HomeCollectionViewCell
            cell?.CollecImage.image = UIImage(named: sujerencias[indexPath.row])
     return cell!
    }
    
    
}
