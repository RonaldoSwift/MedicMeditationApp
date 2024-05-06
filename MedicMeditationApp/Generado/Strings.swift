// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum ForgotPasword {
    internal enum Accept {
      /// Accept
      internal static let text = L10n.tr("Localizable", "forgotPasword.Accept.text", fallback: "Accept")
    }
    internal enum BoxesToSend {
      /// boxes to send a verification email to
      internal static let text = L10n.tr("Localizable", "forgotPasword.BoxesToSend.text", fallback: "boxes to send a verification email to")
    }
    internal enum ForgottenYourPassword {
      /// Forgotten your password? Fill in the
      internal static let text = L10n.tr("Localizable", "forgotPasword.ForgottenYourPassword.text", fallback: "Forgotten your password? Fill in the")
    }
    internal enum YourGmail {
      /// your gmail address.
      internal static let text = L10n.tr("Localizable", "forgotPasword.YourGmail.text", fallback: "your gmail address.")
    }
    internal enum EmailAddress {
      /// Email Address
      internal static let text = L10n.tr("Localizable", "forgotPasword.emailAddress.text", fallback: "Email Address")
    }
    internal enum Title {
      /// Forgot Pasword
      internal static let text = L10n.tr("Localizable", "forgotPasword.title.text", fallback: "Forgot Pasword")
    }
  }
  internal enum SignIn {
    internal enum DonthaveAnAccount {
      /// Dont have  an account?
      internal static let text = L10n.tr("Localizable", "signIn.donthaveAnAccount.text", fallback: "Dont have  an account?")
    }
    internal enum Email {
      /// Email Address
      internal static let text = L10n.tr("Localizable", "signIn.email.text", fallback: "Email Address")
    }
    internal enum ForgotPassword {
      /// Forgot Password?
      internal static let text = L10n.tr("Localizable", "signIn.forgotPassword.text", fallback: "Forgot Password?")
    }
    internal enum Login {
      /// LOGIN
      internal static let text = L10n.tr("Localizable", "signIn.login.text", fallback: "LOGIN")
    }
    internal enum Password {
      /// Password
      internal static let text = L10n.tr("Localizable", "signIn.password.text", fallback: "Password")
    }
    internal enum SignUp {
      /// Sign Up
      internal static let text = L10n.tr("Localizable", "signIn.signUp.text", fallback: "Sign Up")
    }
    internal enum Subtitle {
      /// Sign in now to acces your excercises
      internal static let text = L10n.tr("Localizable", "signIn.subtitle.text", fallback: "Sign in now to acces your excercises")
    }
    internal enum SubtitleDos {
      /// and saved music.
      internal static let text = L10n.tr("Localizable", "signIn.subtitleDos.text", fallback: "and saved music.")
    }
    internal enum Title {
      /// Localizable.strings
      ///   MedicMeditationApp
      /// 
      ///   Created by Ronaldo Andre on 29/04/24.
      internal static let text = L10n.tr("Localizable", "signIn.title.text", fallback: "Sign In")
    }
  }
  internal enum SignUp {
    internal enum AlreadyHave {
      /// Already have an account?
      internal static let text = L10n.tr("Localizable", "signUp.alreadyHave.text", fallback: "Already have an account?")
    }
    internal enum EmailAddress {
      /// Email Address
      internal static let text = L10n.tr("Localizable", "signUp.emailAddress.text", fallback: "Email Address")
    }
    internal enum Name {
      /// Name
      internal static let text = L10n.tr("Localizable", "signUp.name.text", fallback: "Name")
    }
    internal enum Password {
      /// Password
      internal static let text = L10n.tr("Localizable", "signUp.password.text", fallback: "Password")
    }
    internal enum SignIn {
      /// Sign In
      internal static let text = L10n.tr("Localizable", "signUp.signIn.text", fallback: "Sign In")
    }
    internal enum SignUp {
      /// SIGNUP
      internal static let text = L10n.tr("Localizable", "signUp.signUp.text", fallback: "SIGNUP")
    }
    internal enum Subtitle {
      /// Sign up now for free and start
      internal static let text = L10n.tr("Localizable", "signUp.subtitle.text", fallback: "Sign up now for free and start")
    }
    internal enum SubtitleDos {
      /// meditating, and explore Medic.
      internal static let text = L10n.tr("Localizable", "signUp.subtitleDos.text", fallback: "meditating, and explore Medic.")
    }
    internal enum Title {
      /// Sign Up
      internal static let text = L10n.tr("Localizable", "signUp.title.text", fallback: "Sign Up")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
