//
//  HomeTableViewController.swift
//  ProyectoPatrones
//
//  Created by Pablo Marín Gallardo on 7/10/23.
//

import UIKit

// MARK: - Protocolo

protocol HomeViewProtocol: AnyObject {
    func navigateDetail(with data: HeroModel?)
    func updateViews()
}

// MARK: - Clase

class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeViewModelProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        viewModel?.onViewsLoaded()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataCount ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }

        
        if let data = viewModel?.data(at: indexPath.row) {
            cell.updateViews(data: data)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.onItemSelected(at: indexPath.row)
    }
    
}

// MARK: - Extension

extension HomeTableViewController: HomeViewProtocol {
    
    func navigateDetail(with data: HeroModel?) {
        
        guard let data = data else { return }
        
        let detailView = DetailViewController()
        detailView.viewModel = DetailViewModel(viewDelegate: detailView, viewData: data)
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    func updateViews() {
        tableView.reloadData()
    }
    
    
}
