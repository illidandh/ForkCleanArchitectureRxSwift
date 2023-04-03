import UIKit
import Domain

protocol PostsNavigator {
    func toCreatePost()
    func toPost(_ post: Post)
    func toPosts()
}

public class DefaultPostsNavigator: PostsNavigator {
    private let storyBoard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: UseCaseProvider

    public init(services: UseCaseProvider,
         navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
        self.storyBoard = UIStoryboard(name: "Post", bundle: .init(identifier: "org.cocoapods.ListPost"))
    }
    
    public func toPosts() {
        let vc = storyBoard.instantiateViewController(ofType: PostsViewController.self)
        vc.viewModel = PostsViewModel(useCase: services.makePostsUseCase(),
                                      navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }

    func toCreatePost() {
        let navigator = DefaultCreatePostNavigator(navigationController: navigationController)
        let viewModel = CreatePostViewModel(createPostUseCase: services.makePostsUseCase(),
                navigator: navigator)
        let vc = storyBoard.instantiateViewController(ofType: CreatePostViewController.self)
        vc.viewModel = viewModel
        let nc = UINavigationController(rootViewController: vc)
        navigationController.present(nc, animated: true, completion: nil)
    }

    func toPost(_ post: Post) {
        let navigator = DefaultEditPostNavigator(navigationController: navigationController)
        let viewModel = EditPostViewModel(post: post, useCase: services.makePostsUseCase(), navigator: navigator)
        let vc = storyBoard.instantiateViewController(ofType: EditPostViewController.self)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
