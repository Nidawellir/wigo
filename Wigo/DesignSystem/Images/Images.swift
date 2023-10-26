// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Images {
  internal enum Map {
    internal static let back = ImageAsset(name: "Map/back")
    internal static let checkMark = ImageAsset(name: "Map/checkMark")
    internal static let location = ImageAsset(name: "Map/location")
  }
  internal enum CreateAccount {
    internal static let apple = ImageAsset(name: "createAccount/apple")
    internal static let backArrow = ImageAsset(name: "createAccount/backArrow")
    internal static let geolocation = ImageAsset(name: "createAccount/geolocation")
    internal static let grayCross = ImageAsset(name: "createAccount/grayCross")
    internal static let logo = ImageAsset(name: "createAccount/logo")
    internal static let notification = ImageAsset(name: "createAccount/notification")
    internal static let whiteCross = ImageAsset(name: "createAccount/whiteCross")
  }
  internal enum CreateAccountOnboarding {
    internal static let eight = ImageAsset(name: "createAccountOnboarding/eight")
    internal static let first = ImageAsset(name: "createAccountOnboarding/first")
    internal static let five = ImageAsset(name: "createAccountOnboarding/five")
    internal static let four = ImageAsset(name: "createAccountOnboarding/four")
    internal static let nine = ImageAsset(name: "createAccountOnboarding/nine")
    internal static let second = ImageAsset(name: "createAccountOnboarding/second")
    internal static let seven = ImageAsset(name: "createAccountOnboarding/seven")
    internal static let six = ImageAsset(name: "createAccountOnboarding/six")
    internal static let ten = ImageAsset(name: "createAccountOnboarding/ten")
    internal static let third = ImageAsset(name: "createAccountOnboarding/third")
  }
  internal enum Intro {
    internal static let firstIntro = ImageAsset(name: "intro/firstIntro")
    internal static let four = ImageAsset(name: "intro/four")
    internal static let logo = ImageAsset(name: "intro/logo")
    internal static let secondIntro = ImageAsset(name: "intro/secondIntro")
    internal static let thirdIntro = ImageAsset(name: "intro/thirdIntro")
  }
  internal enum MainScrean {
    internal static let addEventButton = ImageAsset(name: "mainScrean/addEventButton")
    internal static let avatar = ImageAsset(name: "mainScrean/avatar")
    internal static let background = ImageAsset(name: "mainScrean/background")
    internal static let checkMarkFilterOff = ImageAsset(name: "mainScrean/checkMarkFilterOff")
    internal static let checkMarkFilterOn = ImageAsset(name: "mainScrean/checkMarkFilterOn")
    internal static let filterButton = ImageAsset(name: "mainScrean/filterButton")
    internal static let location = ImageAsset(name: "mainScrean/location")
    internal static let locationArrow = ImageAsset(name: "mainScrean/locationArrow")
    internal static let mute = ImageAsset(name: "mainScrean/mute")
    internal static let setting = ImageAsset(name: "mainScrean/setting")
    internal static let soundOn = ImageAsset(name: "mainScrean/soundOn")
  }
  internal enum Match {
    internal static let backButton = ImageAsset(name: "match/backButton")
    internal static let playButton = ImageAsset(name: "match/playButton")
  }
  internal enum VideoOnboarding {
    internal static let first = ImageAsset(name: "videoOnboarding/first")
    internal static let four = ImageAsset(name: "videoOnboarding/four")
    internal static let second = ImageAsset(name: "videoOnboarding/second")
    internal static let third = ImageAsset(name: "videoOnboarding/third")
  }
  internal enum VideoRecord {
    internal static let arrow = ImageAsset(name: "videoRecord/arrow")
    internal static let bigDot = ImageAsset(name: "videoRecord/bigDot")
    internal static let check = ImageAsset(name: "videoRecord/check")
    internal static let completedSendRequest = ImageAsset(name: "videoRecord/completedSendRequest")
    internal static let cross = ImageAsset(name: "videoRecord/cross")
    internal static let litleDot = ImageAsset(name: "videoRecord/litleDot")
    internal static let record = ImageAsset(name: "videoRecord/record")
    internal static let retry = ImageAsset(name: "videoRecord/retry")
    internal static let spiner = ImageAsset(name: "videoRecord/spiner")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

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
