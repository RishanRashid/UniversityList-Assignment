//
//  UniversityDetailsRouter.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation

protocol UniversityDetailsRouterProtocol {
    // No requirements
}

class UniversityDetailsRouter: UniversityDetailsRouterProtocol {
    private weak var view: UniversityDetailsViewController?

    func createModule(with data: University) -> UniversityDetailsViewController {
        let view = UniversityDetailsViewController()
        let interactor = UniversityDetailsInteractor()
        let router = UniversityDetailsRouter()
        let presenter = UniversityDetailsPresenter(view: view, interactor: interactor, router: router, university: data)

        view.presenter = presenter
//        interactor.presenter = presenter
        router.view = view

        return view
    }
}
