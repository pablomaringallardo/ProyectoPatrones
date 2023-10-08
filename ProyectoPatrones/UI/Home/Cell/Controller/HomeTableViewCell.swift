//
//  HomeTableViewCell.swift
//  ProyectoPatrones
//
//  Created by Pablo Marín Gallardo on 7/10/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var viewCellHome: UIView!
    @IBOutlet weak var imageCellHome: UIImageView!
    @IBOutlet weak var nameCellHome: UILabel!
    
    
    override func prepareForReuse() {
        imageCellHome.image = nil
        nameCellHome.text = nil
    }
    
    func updateViews(data: HeroModel?) {
        update(name: data?.name)
        update(image: data?.photo)
    }
    
    private func update(name: String?) {
        nameCellHome.text = name ?? ""
    }
    
    private func update(image: String?) {
        imageCellHome.image = UIImage(named: image ?? "")
    }
    
}
