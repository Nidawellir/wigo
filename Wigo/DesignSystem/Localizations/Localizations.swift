// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizations {
  internal enum CreateAccount {
    /// Мы отправим сообщение с кодом подтвеврждения. За отправку сообщения может взиматься плата.
    internal static let codeNotice = Localizations.tr("Localizable", "CreateAccount.codeNotice", fallback: "Мы отправим сообщение с кодом подтвеврждения. За отправку сообщения может взиматься плата.")
    /// Продолжить
    internal static let continueButton = Localizations.tr("Localizable", "CreateAccount.continueButton", fallback: "Продолжить")
    /// Мой номер
    internal static let myNumber = Localizations.tr("Localizable", "CreateAccount.myNumber", fallback: "Мой номер")
    /// Создать аккаунт
    internal static let title = Localizations.tr("Localizable", "CreateAccount.title", fallback: "Создать аккаунт")
    internal enum PrivacyPolicy {
      /// Нажимая кнопку «Продолжить» ты соглашаешься на 
      internal static let firstAtttrebut = Localizations.tr("Localizable", "CreateAccount.PrivacyPolicy.firstAtttrebut", fallback: "Нажимая кнопку «Продолжить» ты соглашаешься на ")
      /// политикой конфиденциальности 
      internal static let fourAtttrebut = Localizations.tr("Localizable", "CreateAccount.PrivacyPolicy.fourAtttrebut", fallback: "политикой конфиденциальности ")
      /// и 
      internal static let thirdAtttrebut = Localizations.tr("Localizable", "CreateAccount.PrivacyPolicy.thirdAtttrebut", fallback: "и ")
      /// обработку персональных данных 
      internal static let twoAtttrebut = Localizations.tr("Localizable", "CreateAccount.PrivacyPolicy.twoAtttrebut", fallback: "обработку персональных данных ")
    }
  }
  internal enum EventDescription {
    /// Добавить локацию
    internal static let addLocation = Localizations.tr("Localizable", "EventDescription.addLocation", fallback: "Добавить локацию")
    /// Выберете пол гостей
    internal static let genderChange = Localizations.tr("Localizable", "EventDescription.genderChange", fallback: "Выберете пол гостей")
    /// Опубликовать
    internal static let publish = Localizations.tr("Localizable", "EventDescription.publish", fallback: "Опубликовать")
  }
  internal enum Gender {
    /// Женщина
    internal static let female = Localizations.tr("Localizable", "Gender.female", fallback: "Женщина")
    /// Мужчина
    internal static let male = Localizations.tr("Localizable", "Gender.male", fallback: "Мужчина")
    /// Я
    internal static let you = Localizations.tr("Localizable", "Gender.You", fallback: "Я")
  }
  internal enum Geolocation {
    /// Твоя локация будет помогать тебе находить интересных людей рядом
    internal static let description = Localizations.tr("Localizable", "Geolocation.description", fallback: "Твоя локация будет помогать тебе находить интересных людей рядом")
    /// Включи
    ///  геолокацию
    internal static let title = Localizations.tr("Localizable", "Geolocation.title", fallback: "Включи\n геолокацию")
  }
  internal enum Intro {
    internal enum ContinueButton {
      /// Далее
      internal static let further = Localizations.tr("Localizable", "Intro.ContinueButton.further", fallback: "Далее")
      /// Давай начнем!
      internal static let letsStart = Localizations.tr("Localizable", "Intro.ContinueButton.letsStart", fallback: "Давай начнем!")
    }
    internal enum SkipButton {
      /// Пропустить
      internal static let skip = Localizations.tr("Localizable", "Intro.skipButton.skip", fallback: "Пропустить")
    }
  }
  internal enum MainScrean {
    /// Привет,
    internal static let hellow = Localizations.tr("Localizable", "MainScrean.hellow", fallback: "Привет,")
  }
  internal enum MatchDescription {
    /// Напишите здесь описание вашего мероприятия...
    internal static let description = Localizations.tr("Localizable", "MatchDescription.description", fallback: "Напишите здесь описание вашего мероприятия...")
    /// Отправить запрос
    internal static let sendRequest = Localizations.tr("Localizable", "MatchDescription.sendRequest", fallback: "Отправить запрос")
  }
  internal enum MeetingPoint {
    /// С точностью до 20 метров
    internal static let accuracy = Localizations.tr("Localizable", "MeetingPoint.accuracy", fallback: "С точностью до 20 метров")
    /// или выбрать место
    internal static let changeLocation = Localizations.tr("Localizable", "MeetingPoint.changeLocation", fallback: "или выбрать место")
    /// Отправить геопозицию
    internal static let sendGeolocation = Localizations.tr("Localizable", "MeetingPoint.sendGeolocation", fallback: "Отправить геопозицию")
  }
  internal enum TurnNotification {
    /// Уведомления позволят тебе всегда оставаться в центре событий.
    internal static let description = Localizations.tr("Localizable", "TurnNotification.description", fallback: "Уведомления позволят тебе всегда оставаться в центре событий.")
    /// Не сейчас
    internal static let notNowButton = Localizations.tr("Localizable", "TurnNotification.notNowButton", fallback: "Не сейчас")
    /// Включи
    ///  уведомления
    internal static let title = Localizations.tr("Localizable", "TurnNotification.title", fallback: "Включи\n уведомления")
    /// Включить
    internal static let turnButton = Localizations.tr("Localizable", "TurnNotification.turnButton", fallback: "Включить")
  }
  internal enum YourBirthday {
    /// Вам должно быть 18 лет или болееВам должно быть 18 лет или более
    internal static let description = Localizations.tr("Localizable", "YourBirthday.description", fallback: "Вам должно быть 18 лет или болееВам должно быть 18 лет или более")
    /// Твой день рождения
    internal static let yourBirthday = Localizations.tr("Localizable", "YourBirthday.yourBirthday", fallback: "Твой день рождения")
  }
  internal enum YourName {
    /// Введи имя
    internal static let sendName = Localizations.tr("Localizable", "YourName.sendName", fallback: "Введи имя")
    /// Ты можешь ввести имя только один раз. Возможности изменить его уже не будет.
    internal static let warning = Localizations.tr("Localizable", "YourName.warning", fallback: "Ты можешь ввести имя только один раз. Возможности изменить его уже не будет.")
    /// Твое имя
    internal static let yourName = Localizations.tr("Localizable", "YourName.yourName", fallback: "Твое имя")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizations {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
