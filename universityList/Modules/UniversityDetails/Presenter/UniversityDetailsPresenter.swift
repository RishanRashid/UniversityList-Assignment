//
//  UniversityDetailsPresenter.swift
//  universityList
//
//  Created by Allnet Systems on 5/7/24.
//

import Foundation

class UniversityDetailsPresenter {
    private weak var view: UniversityDetailsViewController?
    private var interactor: UniversityDetailsInteractorInput
    private var router: UniversityDetailsRouter
    private var university: University

    init(view: UniversityDetailsViewController, interactor: UniversityDetailsInteractorInput, router: UniversityDetailsRouter, university: University) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.university = university
    }

    func viewDidLoad() {
        view?.displayUniversityDetails(university)
    }
}

extension UniversityDetailsPresenter  {
}
