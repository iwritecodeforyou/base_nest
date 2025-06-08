<p align="center">
  <img src="https://drive.google.com/uc?export=view&id=1TZ9S72Het0zgPopCUBAnZe4vfnr1ZaDT" width="200" alt="Base Nest Logo" />
</p>

<h1 align="center">🐣 Base Nest</h1>

<p align="center">
  A clean, scalable Flutter boilerplate with built-in native state management, theming, i18n, networking, storage, and error/loading states—ready out of the box.
</p>

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/flutter-%5E3.7.0-blue?logo=flutter&logoColor=white" alt="Flutter Version" /></a>
  <a href="https://github.com/iwritecodeforyou/base_nest/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-success.svg" alt="License" /></a>
  <a href="https://github.com/iwritecodeforyou/base_nest/stargazers"><img src="https://img.shields.io/github/stars/iwritecodeforyou/base_nest?style=social" alt="GitHub Stars" /></a>
</p>

---

## ✨ Features

- 🚀 **Feature-first modular architecture**  
- ✅ Native state management with `ChangeNotifier` & `Provider`  
- 🌗 Light & Dark themes (via `core/theme`)  
- 🌍 Localization (ARB files under `l10n/` at project root)  
- 🌐 Networking with `dio` + `dio_retry_plus` & retry logic  
- 📶 Connectivity handling (`connectivity_plus`)  
- 💾 Persistent storage (`shared_preferences`)  
- ⚙️ Config folder for environment settings (`config/network_config.dart`)  
- 🧱 Shared UI: buttons, text fields, spacing, responsive wrapper  

---

## 📁 Folder Structure

```text
l10n/                       # ARB localization files
├ app_en.arb
└ app_ar.arb

lib/
├ main.dart                 # App entry point

├ config/                   # Static configuration
│ └ network_config.dart

├ core/                     # Pure building blocks
│ ├ constants/              # app_colors, spacing, text_styles
│ ├ theme/                  # dark_theme, light_theme, theme_manager
│ ├ navigation/             # route_manager.dart
│ ├ localization/           # app_localizations, supported_locales
│ └ utils/                  # logger, extensions, helpers

├ services/                 # Business logic & dependencies
│ ├ network/                # dio_client.dart
│ ├ api_service.dart
│ ├ connectivity_service.dart
│ ├ local_storage_service.dart
│ └ exceptions/             # api_exceptions.dart

├ shared/                   # Cross-feature UI & helpers
│ ├ components/             # custom_button, custom_text_field
│ ├ providers/              # app_settings_provider, localization_provider, theme_provider
│ └ widgets/                # responsive_wrapper, spacing_box

└ features/                 # Vertical slices / domains
  ├ splash/                # splash_screen.dart
  ├ auth/                  # auth_repository, AuthProvider, login_screen
  ├ home/                  # home_screen
  └ …                      # add more (cart, profile, orders, etc.)
```

---

## 🚀 Getting Started

1. **Clone & open**  
   ```bash
   git clone https://github.com/iwritecodeforyou/base_nest.git
   cd base_nest
   ```
2. **Install dependencies**  
   ```bash
   flutter pub get
   ```
3. **Run the app**  
   ```bash
   flutter run
   ```

---

## 📦 Primary Dependencies

| Package                         | Purpose                                           |
|---------------------------------|---------------------------------------------------|
| `provider`                      | Native state management                           |
| `dio`                           | HTTP client                                       |
| `dio_retry_plus`                | Retry interceptor for Dio                         |
| `connectivity_plus`             | Network status detection                          |
| `shared_preferences`            | Key-value persistent storage                      |
| `flutter_localizations`, `intl` | App localization                                  |
| `flutter_launcher_icons`        | Generate app icons                                |
| `change_app_package_name`       | Rename app bundle ID                              |

---

## 🛠 Contributing

We welcome all contributions! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) and our [Code of Conduct](./CODE_OF_CONDUCT.md) before opening issues or PRs.

---

## 📄 License

This project is licensed under the **MIT License**. See [LICENSE](./LICENSE) for details.

---

## 👨‍💻 Maintainer & Community

Maintained with ❤️ by **@iwritecodeforyou**  
Connect on Discord: **iwritecodeforyou**  
Join our Discord community for real-time chat and support: [discord.gg/MrYPhFsq](https://discord.gg/MrYPhFsq)
