//
//  DetailViewModel.swift
//  ProyectoPatrones
//
//  Created by Pablo Marín Gallardo on 7/10/23.
//

import Foundation

protocol DetailViewModelProtocol {
    func viewDidLoad()
}

final class DetailViewModel {
    
    private weak var viewDelegate: DetailViewProtocol?
    private var viewData: HeroModel?
    
    init(viewDelegate: DetailViewProtocol? = nil, viewData: HeroModel) {
        self.viewDelegate = viewDelegate
        self.viewData = viewData
    }
    
    private func loadData() {
        viewDelegate?.updateViews(with: viewData)
    }
}

extension DetailViewModel: DetailViewModelProtocol {
    func viewDidLoad() {
        loadData()
    }
    
    
}
