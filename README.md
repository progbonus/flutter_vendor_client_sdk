Flutter package for [ProgBonus](https://progbonus.ru) Vendor Clients app.

## Features

* Get customer information
* Get customer's bonus information

## Getting started

```dart
import 'package:progbonus_vendor_client/progbonus_vendor_client.dart';

```

## Usage

### JWT auth type

```dart
Get.lazyPut<IProgBonusClient>(
  () => ProgBonusClient(
    baseUrl: Get.find<IAppConfig>().PROGBONUS_API_URL,
    tenantId: Get.find<IAppConfig>().PROGBONUS_TENANT_ID,
    authType: JwtAuthType(
      () => Get.find<AuthService>().idToken,
    ),
  ),
);
```

### Secret auth type

```dart
Get.lazyPut<IProgBonusClient>(
  () => ProgBonusClient(
    baseUrl: Get.find<IAppConfig>().PROGBONUS_API_URL,
    tenantId: Get.find<IAppConfig>().PROGBONUS_TENANT_ID,
    authType: SecretAuthType(
      secret: Get.find<IAppConfig>().PROGBONUS_TENANT_SECRET,
      ts: () {
        // return 'some secret string';
        return DateTime.now().toIso8601String();
      },
    ),
  ),
);
```

## Additional information

Contact us <https://progbonus.ru>
