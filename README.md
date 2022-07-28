Flutter package for [ProgBonus](https://progbonus.ru) Vendor Clients app.

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

Contact us <https://progbonus.ru>
