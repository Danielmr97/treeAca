//
//  MyCurses.swift
//  TreeAcademy
//
//  Created by Daniel Mayo on 04/01/23.
//

import Foundation
import UIKit
class MyCouses: UIViewController {
    @IBOutlet weak var myCourses: UITableView!
    
    private let myCursesName = ["Python","React", "C", "Java","JavaScript","C++","Swift"]
    private let descriptions = "En este curso podras aprender desde nivel basico hasta avanzado"
    private let myCellHeight = UIScreen.main.bounds.height/5
    private let myCellWidth = UIScreen.main.bounds.width/3
    print(myCourses)
    override func viewDidLoad() {
        super.viewDidLoad()
       // collectionview = UICollectionView
        // Do any additional setup after loading the view.
        myCourses.dataSource = self
        myCourses.delegate = self
        myCourses.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomcell")
    }
}
//Numero de celdas
//HOLA (:
extension MyCouses : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCursesName.count
    }
    //contendo
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCustomcell", for: indexPath) as? CustomTableViewCell
        cell?.Namecell.text = myCursesName[indexPath.row]
        cell?.DescriptionCell.text = descriptions
        cell?.imageCell.image = UIImage(named: myCursesName[indexPath.row])
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    //Altura
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return myCellHeight
    }
    
}
extension MyCouses : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


