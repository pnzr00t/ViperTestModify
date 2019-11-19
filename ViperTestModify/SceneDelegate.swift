//
//  SceneDelegate.swift
//  ViperTestModify
//
//  Created by 	Oleg2 on 07.11.2019.
//  Copyright © 2019 Oleg Pustoshkin. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var serviceContainer: ServiceContainer = ServiceContainer() // ServiceContainer / Modify Factory


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { print("(scene as? UIWindowScene)", #function); return }
        
        guard let navigationController = UIStoryboard(name: "PostList", bundle: nil).instantiateViewController(identifier: "NavigationControllerID") as? UINavigationController else { print("StoryBoard Instantiate. Navigation controller", #function); return }
       
        guard let postListViewController = navigationController.topViewController as? PostListViewController else { print("postListViewController view controller get from navigation ocntroller", #function); return }
        
        if self.window == nil {
            self.window = UIWindow(frame: UIScreen.main.bounds)
        }
        guard let mainWindow = self.window else { print("self.window?", #function); return }
        

        
        let postListConfigurator = PostListModuleConfigurator()
        postListConfigurator.configureModuleForViewInput(viewInput: postListViewController, serviceContainer: self.serviceContainer)
        mainWindow.rootViewController = navigationController
        mainWindow.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

