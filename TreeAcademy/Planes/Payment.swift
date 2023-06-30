//
//   Payment.swift
//  TreeAcademy
//
//  Created by Daniel Mayo on 04/01/23.
//

import Foundation
import UIKit

class PaymentController: UIViewController {

    @IBOutlet weak var PaymentCollection: UICollectionView!
    @IBOutlet weak var MyPageControl: UIPageControl!

    private let plans = ["Plan1","Plan2","Plan3"]
    private let myCellHeight = UIScreen.main.bounds.height
    private let myCellWidth = UIScreen.main.bounds.width
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PaymentCollection.dataSource = self
        PaymentCollection.delegate = self
        PaymentCollection.register(UINib(nibName: "PaymentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "paycell")
        MyPageControl.currentPage = 0
        MyPageControl.numberOfPages = plans.count

    }

}

extension PaymentController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plans.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PaymentCollection.dequeueReusableCell(withReuseIdentifier: "paycell", for: indexPath) as? PaymentCollectionViewCell
        cell!.PlanesImage.image = UIImage(named: plans[indexPath.row])
    
    
        return cell!
    
    
}

}
extension PaymentController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("\(indexPath.section) \(indexPath.row)")
    }
}

extension PaymentController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        MyPageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCellWidth , height: myCellWidth)
    }
    //Espacio entre columnas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //Espacio entre lineas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

