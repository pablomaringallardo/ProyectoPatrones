//
//  DetailViewController.swift
//  ProyectoPatrones
//
//  Created by Pablo Marín Gallardo on 7/10/23.
//

import UIKit


// MARK: - Protocolo

protocol DetailViewProtocol: AnyObject {
    func updateViews(with data: HeroModel?)
}


// MARK: - Clase

class DetailViewController: UIViewController {
    
    var viewModel: DetailViewModelProtocol?
    
    @IBOutlet weak var nameHeroDetail: UILabel!
    @IBOutlet weak var imageHeroDetail: UIImageView!
    @IBOutlet weak var descriptionHeroDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
    
    private func update(name: String?) {
        nameHeroDetail.text = name ?? ""
    }
    
    private func update(image: String?) {
        imageHeroDetail.setImage(url: image ?? "")
    }
    
    private func update(description: String?) {
        descriptionHeroDetail.text = description ?? ""
    }
}


// MARK: - Extension

extension DetailViewController: DetailViewProtocol {
    func updateViews(with data: HeroModel?) {
        
        guard let data = data else { return }
        
        update(name: data.name)
        update(image: data.photo)
        update(description: data.description)
    }
    
    
}
