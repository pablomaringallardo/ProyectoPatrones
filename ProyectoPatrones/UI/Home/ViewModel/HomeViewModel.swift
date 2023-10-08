//
//  HomeViewModel.swift
//  ProyectoPatrones
//
//  Created by Pablo Marín Gallardo on 7/10/23.
//

import Foundation

// MARK: - Protocolo

protocol HomeViewModelProtocol {
    var dataCount: Int { get }
    func onViewsLoaded()
    func data(at index: Int) -> HeroModel?
    func onItemSelected(at index: Int)
}


// MARK: - Clase

final class HomeViewModel {
    
    private weak var viewDelegate: HomeViewProtocol?
    private var viewData = HeroesModel()
    
    init(viewDelegate: HomeViewProtocol? = nil) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewData = heroesData
        viewDelegate?.updateViews()
    }
}


// MARK: - Extension

extension HomeViewModel: HomeViewModelProtocol {
    func onItemSelected(at index: Int) {
        guard let data = data(at: index) else {return}
        viewDelegate?.navigateDetail(with: data)
    }
    
    func data(at index: Int) -> HeroModel? {
        guard index < dataCount else {return nil}
        return viewData[index]
    }
    
    var dataCount: Int {
        viewData.count
    }
    
    func onViewsLoaded() {
        loadData()
    }
    
    
}
