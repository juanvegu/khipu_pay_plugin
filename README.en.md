# KhipuPay

Español [README.md] | English

KhipuPay is a library that allows you to integrate Khipu payments into your Flutter app.

## Example

To use any of the following examples, you need to import the library.

```dart
import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';
```

### Initialize

There are two ways to instance the library, we recommend using the first one, because take the apiKey value from the environment variables.

This is the best approach because it allows you to keep your API key secure and not expose it in the code.

```dart
KhipuPay.initialize();
```

The second way is to pass the keyMode and apiKey values directly to the initialize method.

```dart
KhipuPay.initialize(
  keyMode: KeyMode.normal,
  apiKey: 'your_api_key',
);
```

### Create Payment

To create a payment, you need to call the `createPayment` method and pass a `KhipuPaymentForm` object as a parameter. The `createPayment` method will return a `KhipuPayment` object.

```dart
KhipuPayment khipuPayment = await KhipuPay.instance.createPayment(
  KhipuPaymentForm(
    subject: 'Test Payment',
    amount: 1000,
    currency: 'CLP',
    transactionId: '123',
    payerName: 'John Doe',
  )
);
```

### Process Payment

To process a payment, you need to call the `processPayment` method and pass a `paymentId` as a parameter, obtained from the `createPayment` method. The `processPayment` method will return a `KhipuResult` object.

```dart
KhipuResult? result = await KhipuPay.instance.processPayment(paymentId: 'your_payment_id');
```

### Check Status Payment

To check the status of a payment, you need to call the `paymentStatus` method and pass a `paymentId` as a parameter, obtained from the `createPayment` method. The `paymentStatus` method will return a `KhipuPayment` object.

```dart
KhipuPayment? payment = await KhipuPay.instance.paymentStatus(paymentId: 'your_payment_id');
```

### Platform-specific Considerations

#### Android

In the gradle-wrapper.properties file, change the distributionUrl to the latest version of Gradle.

We recommend using the following version: `https\://services.gradle.org/distributions/gradle-8.4-bin.zip`

In the `build.gradle` file, change the `com.android.tools.build:gradle` version to the latest version compatible with the Gradle version in this case `8.3.2`.

#### iOS
Remove use_frameworks! of Podfile, to avoid conflicts with Khipu library

```
target 'Runner' do
  use_frameworks!
```

## Important
* This library is not official, it was created to facilitate the integration of Khipu payments into Flutter apps.
* Khipu provide an apiKey for development and production environment, you must change these fields, depending on the environment in which your application is located, so that you can process your payments correctly.


## References

* [How to Store API Keys in Flutter](https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/)

### License

[MIT](https://choosealicense.com/licenses/mit/)
