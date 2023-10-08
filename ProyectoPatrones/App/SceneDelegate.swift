//
//  SceneDelegate.swift
//  ProyectoPatrones
//
//  Created by Pablo Marín Gallardo on 7/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController()
        let splashViewController = SplashViewController()
        splashViewController.viewModel = SplashViewModel(viewDelegate: splashViewController)
        
        navigationController.setViewControllers([splashViewController], animated: true)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
    }
}

