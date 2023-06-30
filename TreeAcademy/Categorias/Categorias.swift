//
//  Categorias.swift
//  TreeAcademy
//
//  Created by Daniel Mayo on 03/01/23.
//

import UIKit

class CollectionviewControler: UIViewController {
    @IBOutlet weak var Categorias: UICollectionView!
    private let myContry = ["Ingenieria","Derecho","Psicologia","Odontologia","Medicina","Veterinaria","Filosofia","Ciencias","Contaduria","Arquitectura","Economia","Quimica"]
    private let myCellWidth = UIScreen.main.bounds.width/2
    private let myCellHeight = UIScreen.main.bounds.height/5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UIScreen.main.bounds.width)
        //Categorias.backgroundColor = .green
        Categorias.dataSource = self
        Categorias.delegate = self
        Categorias.register(UINib (nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
    }
}
extension CollectionviewControler : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myContry.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Categorias.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? MyCustomCollectionViewCell
        
        cell!.myLabel.text = myContry[indexPath.row]
        cell!.Myimage.image = UIImage(named: myContry[indexPath.row])
        cell!.Myimage.layer.cornerRadius = 7.5
        return cell!
    }
}
//Index selecction
extension CollectionviewControler : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("\(indexPath.section) \(indexPath.row) \(myContry[indexPath.row])")
    }
}
extension CollectionviewControler : UICollectionViewDelegateFlowLayout{
    //Medidas de celda
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCellWidth , height: myCellHeight)
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
