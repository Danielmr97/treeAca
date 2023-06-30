//
//  Perfil.swift
//  TreeAcademy
//
//  Created by Daniel Mayo on 05/01/23.
//

import Foundation
import UIKit

class PerfilController: UIViewController {

    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var ProfileLabel: UILabel!
    @IBOutlet weak var TablePerfil: UITableView!
    
    private let setings = ["Editar Perfil","Formas de pago","Historial","Favoritos","Cerificados" ,"Ayuda"]
    private let myCellHeight = UIScreen.main.bounds.height/13
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileImage.image = UIImage(named: "perfil")
        ProfileLabel.text = "Jesus Daniel"
        ProfileImage.layer.cornerRadius = 200
        
        TablePerfil.dataSource = self
        TablePerfil.delegate = self
        TablePerfil.register(UINib(nibName: "PerfilTableViewCell", bundle: nil), forCellReuseIdentifier: "cellPerfil")
    }
}

extension PerfilController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellPerfil", for: indexPath) as? PerfilTableViewCell
        
        cell?.perfilLabel.text = setings[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
}

extension PerfilController : UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return myCellHeight
    }
}
