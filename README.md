# String Utility

an extension library to deal with common String and Regex problem.

avoid copy-pasta common regex by using this library.


# Features
* check string contain lowercase and uppercase
* check string contain space
* check is string alphanumerc, alphanumeric uppercase., alphanumeric uppercase with symbol.
* remove extra whitespace.
* censor sensitive string
* check is string url formal
* check is string email fomat


# Installing

add this to pubspec.yaml
``` 
string_utility: any
```

get dependency 
```
pub get
```

or 
```
flutter pub get
```

# Usage

import first 
```
import 'package:string_utility/string_utility.dart';

```


then, you can start using for example checking string is a valid email :

```
print('me@mtmail.co.id'.isEmail)

// True
```