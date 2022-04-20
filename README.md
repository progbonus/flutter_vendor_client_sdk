<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Flutter package for ProgBonus Vendor Clients app.

## Features

* Get customer information
* Get customer's bonus information

## Getting started

```dart
import 'package:progbonus_vendor_client/progbonus_vendor_client.dart';

```

## Usage

```dart
Get.lazyPut<IProgBonusClient>(
    () => ProgBonusClient(
      baseUrl: Get.find<IAppConfig>().PROGBONUS_API_URL,
      tenantsId: Get.find<IAppConfig>().PROGBONUS_TENANT_ID,
      secret: Get.find<IAppConfig>().PROGBONUS_TENANT_SECRET,
      getAccessToken: () {
        final accessToken = Get.find<AuthService>().idToken;
        return accessToken;
      },
    ),
  );
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
