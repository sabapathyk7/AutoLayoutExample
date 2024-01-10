//
//  SceneDelegate.swift
//  AutoLayoutExample
//
//  Created by kanagasabapathy on 10/01/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let window = window as UIWindow? else {
            window?.makeKeyAndVisible()
            return
        }
        let viewcontroller: ViewController = ViewController()
        window.rootViewController = viewcontroller
        window.makeKeyAndVisible()
    }
}
