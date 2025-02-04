## TUtils

A reusable Flutter Utils package for tons of widgets and helper functions.

## Features

- **Styled notifications** for different types: Success, Error, Warning, and Info.
- **Automatically dismisses** after a configurable duration.
- **Supports stacking multiple notifications.**
- **Highly customizable** UI and message content.
- **Easy to integrate** into any Flutter project.

## Usage

### Step 1: Add Dependency

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  t_utils: ^2.1.0
```

### Step 2: Import the Package

In your Dart file, import the package:

Pub.dev

```dart
import 'package:t_utils/t_utils.dart';
```

Github Usage

```yaml
dependencies:
  t_utils:
    git:
      url: https://github.com/CodingwithTea/t_utils.git
      ref: v2.1.0
```

Local Usage

```yaml
dependencies:
  t_utils:
    path: /path/to/t_utils
```

### Step # 3: Push Changes to Github

- Push new changes on the Git using tagging.
- Create new tag using

```shell
git tag v2.1.0
```

- Then push the code using

```shell
git push origin v2.1.0
```


### Steps to Update an Existing Tag
Delete the existing tag locally and remotely

```shell 
git tag -d v2.1.0
```
- Delete the tag from GitHub
```shell
git push origin --delete v2.1.0
``` 



### Additional Information

- Contributions: If you'd like to contribute to this project, please open a pull request or submit
  an issue. Contributions are welcome to improve the UI or add new features.
- Issues: If you encounter any bugs or have suggestions for improvements, please file an issue in
  the repository.
- Support: The package is actively maintained, and issues are typically addressed within 1–2
  business days.
