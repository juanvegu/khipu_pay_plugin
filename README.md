# KhipuPay

A Flutter plugin that uses Khipu libraries to process payments in applications developed with Flutter

This plugin also has support to create payment identifiers and validate payment status.

## AndroidManifest changes

To use the plugin on Android, you must modify the android: name of application, since you need to have an instance of KhenshinInterface

```xml
<application
    android:name="io.flutter.app.FlutterApplication"
```

to

```xml
<application
    android:name="com.duckytie.khipupay.KhipuApplication"
```

This change will not change the normal functionality of your application, since the KhipuApplication class also extends from FlutterApplication

## Podfile changes

Remove use_frameworks! of Podfile, to avoid conflicts with Khipu bookstore

```
target 'Runner' do
  use_frameworks!
```

## Add Color

In Android, the color of Khipu is set in the color.xml
```xml
<color name="khenshin_primary">#ca0814</color> <!-- Navigation bar color and main button -->
<color name="khenshin_primary_dark">#580409</color> <!-- Color of the top status bar -->
<color name="khenshin_primary_text">#ffffff</color> <!-- Text color in the navigation bar -->
<color name="khenshin_accent">#ca0814</color> <!-- Color of the decorations, for example progress bars -->
```

On iOS, the color of Khipu is set in the initialize method

```dart
void main() {
  runApp(MyApp());
  KhipuPay.initialize(hexaColor: "#e5be01");
}
```

*IMPORTANT: If you do not provide a hexadecimal color or it is wrong, the default color is black.

## Additional Settings

In your project, you may need to add the [Android Multidex]. Apparently this is a requirement for khenshin 7.1.2.

## How to use the plugin

1. To generate a payment identifier, you must submit the fields required by Khipu, the email field is not mandatory.

```dart
import 'package:khipu_pay/khipu_payment.dart';

String idPayment = await KhipuPayment().getPaymentId(
    id: "id", //Information delivered by khipu
    secret: "secret", //Information delivered by khipu
    subject: "subject of payment",
    amount: "1000", //This value must be greater than 0
    currency: "CLP",
    email: "email@email.cl",
);
```

2. Once the payment identifier is generated, you can process the payment by Khipu, it will return a "SUCCESS" if the transaction was correct or a "FAILURE" if the transaction fails or is canceled.

```dart
import 'package:khipu_pay/khipu_pay.dart';

String statusProcess = await KhipuPay.paymentProcess(paymentId: idPayment);
```

3. Before or after making the payment, you can check the status of the generator identifier.

```dart
import 'package:khipu_pay/khipu_payment_status.dart';

String statusPayment = await KhipuPaymentStatus().status(
    transactionCode: idPayment,
    id: "id", //Information delivered by khipu
    secret: "secret", //Information delivered by khipu
);
```

Remember that Khipu provides id and secret for development and production environment, you must change these fields, depending on the environment in which your application is located, so that you can process your payments correctly.

## Extra Information

  - Tests were done with all the banks and in some cases it returned error with Corpbanca and Itau banks.
  - Only use emulators, for testing with id and development secret


## License
[MIT](https://choosealicense.com/licenses/mit/)

[android multidex]: <https://developer.android.com/studio/build/multidex>