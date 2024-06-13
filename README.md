# KhipuPay

Español | [English](README.en.md)

KhipuPay es una librería que te permite integrar pagos Khipu en tu app Flutter.

## Ejemplo

Para utilizar cualquiera de los siguientes ejemplos, es necesario importar la biblioteca.

```dart
import 'package:khipu_pay_plugin/khipu_pay_plugin.dart';
```

### Inicializar

Hay dos formas de instanciar la librería, recomendamos usar la primera, porque toma el valor apiKey de las variables de entorno.

Este es el mejor enfoque, ya que le permite mantener su clave de API segura y no exponerla en el código.

```dart
KhipuPay.initialize();
```

La segunda forma es pasar el apiKey directamente al método initialize.

```dart
KhipuPay.initialize(
  apiKey: 'your_api_key',
);
```

**IMPORTANTE:** Para procesar un pago no es necesario inicializar la libreria, ya que las llamadas a la API de Khipu se pueden hacer desde el backend. Por lo que solo es necesario inicializar la librería si se desea hacer llamadas a la API de Khipu desde el frontend.

### Create Payment

Para crear un pago, es necesario llamar al método `createPayment` y pasar un objeto `KhipuPaymentForm` como parámetro. El método `createPayment` devolverá un objeto `KhipuPayment`.

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

### Procesar el pago

Para procesar un pago, es necesario llamar al método `processPayment` y pasar un `paymentId` como parámetro, obtenido del método `createPayment`. El método `processPayment` devolverá un objeto `KhipuResult`.

```dart
KhipuResult? result = await KhipuPay.processPayment(paymentId: 'your_payment_id');
```

### Comprobar el estado del pago

Para comprobar el estado de un pago, es necesario llamar al método `paymentStatus` y pasar un `paymentId` como parámetro, obtenido del método `createPayment`. El método `paymentStatus` devolverá un objeto `KhipuPayment`.

```dart
KhipuPayment? payment = await KhipuPay.instance.paymentStatus(paymentId: 'your_payment_id');
```

### Consideraciones específicas de la plataforma

#### Android

En el archivo gradle-wrapper.properties, cambia el distributionUrl a la última versión de Gradle.

Recomendamos utilizar la siguiente versión: `https\://services.gradle.org/distributions/gradle-8.4-bin.zip`.

En el archivo `build.gradle`, cambia la versión `com.android.tools.build:gradle` por la última versión compatible con la versión de Gradle en este caso `8.3.2`.

#### iOS

Eliminar use_frameworks! de Podfile, para evitar conflictos con la librería Khipu

```ruby
target 'Runner' do
  use_frameworks!
```

## Importante

* Esta librería no es oficial, fue creada para facilitar la integración de pagos Khipu en apps Flutter.
* Khipu proporciona una apiKey para entorno de desarrollo y producción, debes cambiar estos campos, dependiendo del entorno en el que se encuentre tu aplicación, para que puedas procesar tus pagos correctamente.

## Referencias

* [Cómo almacenar claves de API en Flutter](https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/)

### Licencia

[MIT](https://choosealicense.com/licenses/mit/)
