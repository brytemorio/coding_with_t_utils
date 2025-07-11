## TUtils

A reusable Flutter Utils package for tons of widgets and helper functions.

## Features

- **Widgets Box** You can now use pre-built TContainer, TImage, Dropdowns, Appbar, Header, Breadcrumbs, DataTables, Layouts, Rich Text Editor and much more.
- **Constants** Everything a project needs, You can get pre-build Colors, Sizes and can also customize them easily.
- **Exceptions** Now manage exceptions like a breeze.
- **Helper Functions** Tons of only use-able functions.
- **Validators, Popups, Formatters and much more**

## Usage

### Step 1: Add Dependency

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  t_utils: ^0.0.4
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
      ref: v0.0.4
```

Local Usage

```yaml
dependencies:
  t_utils:
    path: /path/to/t_utils
```


### Step 3: Use Widgets
Use Widgets like a breeze:

```dart
TContainer(
  child: Center(child: Text('Default')),
),
```

```dart
TContainer(
  width: 120,
  height: 50,
  onTap: () {
    print('Tapped!');
  },
  showRipple: true,
  child: Center(child: Text('Clickable')),
),
```

```dart
TContainer(
  width: 350,
  height: 100,
  alignment: Alignment.bottomCenter,
  shadow: BoxShadow(
    color: Colors.red.withValues(alpha: 0.5),
    spreadRadius: 5,
    blurRadius: 10,
    offset: Offset(0, 5),
  ),
  child: Text('Custom Shadow with custom alignment'),
),
```

CHOICE CHIPS

```dart
TChoiceChip(
  text: "0xFFAB3559", // Color value
  selected: false,
  isColorAttribute: true,
  selectedTextColor: Colors.white,
  onSelected: (isSelected) {
    // Handle color selection
  },
),
TChoiceChip(
  text: "Custom Chip with Icon",
  selected: true,
  selectedTextColor: Colors.blue,
  unselectedTextColor: Colors.grey,
  backgroundColor: Colors.amberAccent,
  customCheckmarkIcon:
    Icon(Icons.health_and_safety_rounded, color: Colors.blue),
  borderShape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  onSelected: (isSelected) {
    // Handle selection
  },
),
```

DROPDOWNS
```dart
TDropdown<String>(
  labelText: "Select Country: Menu",
  popupStyle: DropdownPopupStyle.menu,
  showSearchBox: true,
  items: (query, _) =>
    Future.value(['USA', 'Canada', 'India', 'Pakistan']),
    onChanged: (value) {
      print("Selected: $value");
    },
),

TDropdown<String>(
  labelText: "Search Country: BottomSheet",
  showSearchBox: true,
  popupStyle: DropdownPopupStyle.bottomSheet,
  items: (query, _) => Future.value(
    ['USA', 'Canada', 'India', 'Germany', 'Australia', 'Pakistan']),
  onChanged: (value) {
    print("Selected: $value");
  },
),
```




### Additional Information

- Contributions: If you'd like to contribute to this project, please open a pull request or submit
  an issue. Contributions are welcome to improve the UI or add new features.
- Issues: If you encounter any bugs or have suggestions for improvements, please file an issue in
  the repository.
- Support: The package is actively maintained, and issues are typically addressed within 1–2
  business days.
