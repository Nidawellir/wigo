//
//  IntroPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class IntroPresenter {
    
    // MARK: - Public properties
    
    weak var output: IntroPresenterOutput?
    
    // MARK: - Private properties
    
    private let introViewModels: [IntroCollectionViewCell.ViewModel] = [
        .init(title: "Найди\n событие", description: "Используй рекомендации, чтобы найти лучшее событие для себя", image: Images.Intro.firstIntro.name),
        .init(title: "Создай\n событие", description: "Приглашай гостей на свое событие", image: Images.Intro.secondIntro.name),
        .init(title: "Выбирай\n компанию", description: "Просмотри заявки и выбери подходящие", image: Images.Intro.thirdIntro.name),
        .init(title: "Встречайся", description: "Как только твоя встреча\n подтверждена, будь готов как\n можно быстрее встретиться с\n новым другом", image: Images.Intro.four.name),
    ]
    
    // MARK: - Usecases
}

// MARK: - IntroPresenterInput

extension IntroPresenter: IntroPresenterInput {
    func fetchIntroViewModels() {
        output?.didFetchIntro(viewModels: introViewModels)
    }
}
