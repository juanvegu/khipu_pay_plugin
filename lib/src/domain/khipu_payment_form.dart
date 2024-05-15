final class KhipuPaymentForm {
  int amount;
  String currency;
  String subject;
  String? transactionId;
  String? custom;
  String? body;
  String? bankId;
  String? returnUrl;
  String? cancelUrl;
  String? pictureUrl;
  String? notifyUrl;
  String? contractUrl;
  String? notifyApiVersion;
  DateTime? expiresDate;
  bool? sendEmail;
  String? payerName;
  String? payerEmail;
  bool? sendReminders;
  String? responsibleUserEmail;
  String? fixedPayerPersonalIdentifier;
  String? integratorFee;
  String? collectAccountUuid;
  DateTime? confirmTimeoutDate;
  String? mandatoryPaymentMethod;
  String? pspClientMerchantName;

  KhipuPaymentForm({
    required this.amount,
    required this.currency,
    required this.subject,
    this.transactionId,
    this.custom,
    this.body,
    this.bankId,
    this.returnUrl,
    this.cancelUrl,
    this.pictureUrl,
    this.notifyUrl,
    this.contractUrl,
    this.notifyApiVersion,
    this.expiresDate,
    this.sendEmail,
    this.payerName,
    this.payerEmail,
    this.sendReminders,
    this.responsibleUserEmail,
    this.fixedPayerPersonalIdentifier,
    this.integratorFee,
    this.collectAccountUuid,
    this.confirmTimeoutDate,
    this.mandatoryPaymentMethod,
    this.pspClientMerchantName,
  });

  factory KhipuPaymentForm.fromJson(Map<String, dynamic> json) {
    return KhipuPaymentForm(
      amount: json['amount'],
      currency: json['currency'],
      subject: json['subject'],
      transactionId: json['transaction_id'],
      custom: json['custom'],
      body: json['body'],
      bankId: json['bank_id'],
      returnUrl: json['return_url'],
      cancelUrl: json['cancel_url'],
      pictureUrl: json['picture_url'],
      notifyUrl: json['notify_url'],
      contractUrl: json['contract_url'],
      notifyApiVersion: json['notify_api_version'],
      expiresDate: DateTime.parse(json['expires_date']),
      sendEmail: json['send_email'],
      payerName: json['payer_name'],
      payerEmail: json['payer_email'],
      sendReminders: json['send_reminders'],
      responsibleUserEmail: json['responsible_user_email'],
      fixedPayerPersonalIdentifier: json['fixed_payer_personal_identifier'],
      integratorFee: json['integrator_fee'],
      collectAccountUuid: json['collect_account_uuid'],
      confirmTimeoutDate: DateTime.parse(json['confirm_timeout_date']),
      mandatoryPaymentMethod: json['mandatory_payment_method'],
      pspClientMerchantName: json['psp_client_merchant_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'amount': amount,
      'currency': currency,
      'subject': subject,
      'transaction_id': transactionId,
      'custom': custom,
      'body': body,
      'bank_id': bankId,
      'return_url': returnUrl,
      'cancel_url': cancelUrl,
      'picture_url': pictureUrl,
      'notify_url': notifyUrl,
      'contract_url': contractUrl,
      'notify_api_version': notifyApiVersion,
      'expires_date': expiresDate?.toIso8601String(),
      'send_email': sendEmail,
      'payer_name': payerName,
      'payer_email': payerEmail,
      'send_reminders': sendReminders,
      'responsible_user_email': responsibleUserEmail,
      'fixed_payer_personal_identifier': fixedPayerPersonalIdentifier,
      'integrator_fee': integratorFee,
      'collect_account_uuid': collectAccountUuid,
      'confirm_timeout_date': confirmTimeoutDate?.toIso8601String(),
      'mandatory_payment_method': mandatoryPaymentMethod,
      'psp_client_merchant_name': pspClientMerchantName,
    };
    data.removeWhere((_, value) => value == null);
    return data;
  }
}