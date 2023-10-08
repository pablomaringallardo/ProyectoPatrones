//
//  SplashViewController.swift
//  ProyectoPatrones
//
//  Created by Pablo Marín Gallardo on 7/10/23.
//

import UIKit


// MARK: - Protocolo

protocol SplashViewProtocol: AnyObject {
    
    func showLoading(_ show: Bool)
    func navigateToHome()
}


// MARK: - Clase

class SplashViewController: UIViewController {

    var viewModel: SplashViewModelProtocol?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SplashViewModel(viewDelegate: self)
        viewModel?.onViewsLoaded()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }
}


// MARK: - Extension

extension SplashViewController: SplashViewProtocol {
    func showLoading(_ show: Bool) {
        switch show {
        case true where !activityIndicator.isAnimating:
            activityIndicator.startAnimating()
        case false where activityIndicator.isAnimating:
            activityIndicator.stopAnimating()
        default: break
        }
    }
    
    func navigateToHome() {
        let nextView = HomeTableViewController()
        nextView.viewModel = HomeViewModel(viewDelegate: nextView)
        navigationController?.setViewControllers([nextView], animated: true)
    }
}
