import Foundation
import Domain
import NetworkPlatform
import ListPost

final class Application {
    static let shared = Application()

    private let networkUseCaseProvider: Domain.UseCaseProvider

    private init() {
        self.networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
    }

    func configureMainInterface(in window: UIWindow) {
        let cdNavigationController = UINavigationController()
        cdNavigationController.tabBarItem = UITabBarItem(title: "CoreData",
                image: UIImage(named: "Box"),
                selectedImage: nil)
        let cdNavigator = DefaultPostsNavigator(services: networkUseCaseProvider,
                navigationController: cdNavigationController)

        let rmNavigationController = UINavigationController()
        rmNavigationController.tabBarItem = UITabBarItem(title: "Realm",
                image: UIImage(named: "Toolbox"),
                selectedImage: nil)
        let rmNavigator = DefaultPostsNavigator(services: networkUseCaseProvider,
                navigationController: rmNavigationController)

        let networkNavigationController = UINavigationController()
        networkNavigationController.tabBarItem = UITabBarItem(title: "Network",
                image: UIImage(named: "Toolbox"),
                selectedImage: nil)
        let networkNavigator = DefaultPostsNavigator(services: networkUseCaseProvider,
                navigationController: networkNavigationController)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
                cdNavigationController,
                rmNavigationController,
                networkNavigationController
        ]
        window.rootViewController = tabBarController

        cdNavigator.toPosts()
        rmNavigator.toPosts()
        networkNavigator.toPosts()
    }
}
