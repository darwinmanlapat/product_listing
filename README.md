# **PRODUCT LISTING**

## **Dependency**

| **DEPENDENCY** | **VERSION** |
|----------------|-------------|
| Flutter        | 3.16.8      |
| Dart           | 3.2.5       |
| Xcode          | 15.2.0      |
| Android Studio | 11.0+13     |

<br><hr><br>

## **Tech Stack**

**State Management:** <br>
- bloc: ^8.1.1
- bloc_concurrency: ^0.2.1
- flutter_bloc: ^8.1.2
- flutter_hooks: ^0.18.6

**HTTP Client:** <br>
- dio: ^5.1.1 

**Miscellaneous:** <br>
- shimmer: ^2.0.0
- equatable: ^2.0.5
- flutter_dotenv: ^5.0.2

**Testing:** <br>
- test: ^1.22.0
- bloc_test: ^9.1.1
- mocktail: ^0.3.0

<br><hr><br>

## **Setting Up Dev Local Environment**

- Install [Flutter](https://docs.flutter.dev/get-started/install) manually or using [FVM](https://fvm.app/docs/getting_started/installation), [Android Studio](https://developer.android.com/studio/install), and [Xcode](https://apps.apple.com/us/app/xcode/id497799835).

- Clone the project from [GitHub](https://github.com/darwinmanlapat/bloc_product_listing.git).

- Create .env file for [environment variables](https://docs.google.com/document/d/1LqW43Y5xLz5xWtfANveMOwpz1OS49DVMmiIKJpXivjk/edit?usp=sharing)

- To run the app, run flutter run. If you are using Visual Studio Code, go to Run and Debug and choose the [launch configuration](https://code.visualstudio.com/docs/editor/debugging#_launch-configurations).

<br><hr><br>

## **Test**

- Run `flutter test`

<br><hr><br>

## **Folder Structure**

<br>

```bash
.
├── assets
│   ├── images
└── lib
│   ├── core
│   │   ├── widgets                  # Reusable  widgets
│   │   ├── helper                   # Reusable helpers
│   │   ├── service                  # Reusable services
│   │   ├── utils                    # Reusable utilities
│   │   ├── config                   # App Configuration
│   │   ├── routes
│   │   ├── enum
│   ├── feature
│   │   ├── <feature/module>
│   │   │   ├── data
│   │   │   │   ├── data_sources           
│   │   │   │   │   ├── remote        # API Calls
│   │   │   │   │   ├── local         # Local or Cache Data
│   │   │   │   └── repository        # Repository Implementations
│   │   │   ├── dependency_injection  # Dependency Injections
│   │   │   ├── domain
│   │   │   │   ├── model
│   │   │   │   └── repository       # Abstract Repository
│   │   │   └── presentation
│   │   │       ├── component        # Reusable widgets
│   │   │       ├── screen           # Pages
│   │   │       ├── layout           # Layout
│   │   │       └── blocs            # Providers
│   │   ├── <feature/module>
│   │   └── ...
│   
└── test
    └── <feature/module>
        ├── data                      # Data Layer Tests
        ├── dependency_injection      # Dependency Injection Tests
        ├── domain                    # Domain Layer Tests
        └── blocs                     # Bloc Tests
```