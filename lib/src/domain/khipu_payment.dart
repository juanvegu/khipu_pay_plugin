final class KhipuPayment {
  String paymentId;
  String paymentUrl;
  String simplifiedTransferUrl;
  String transferUrl;
  String appUrl;
  bool readyForTerminal;
  String? notificationToken;
  int? receiverId;
  String? conciliationDate;
  String? subject;
  String? amount;
  String? currency;
  String? status;
  String? statusDetail;
  String? body;
  String? pictureUrl;
  String? receiptUrl;
  String? returnUrl;
  String? cancelUrl;
  String? notifyUrl;
  String? notifyApiVersion;
  String? expiresDate;
  List<String>? attachmentUrls;
  String? bank;
  String? bankId;
  String? payerName;
  String? payerEmail;
  String? personalIdentifier;
  String? bankAccountNumber;
  bool? outOfDateConciliation;
  String? transactionId;
  String? custom;
  String? responsibleUserEmail;
  bool? sendReminders;
  bool? sendEmail;
  String? paymentMethod;
  String? fundsSource;
  String? discount;
  String? thirdPartyAuthorizationDetails;

  KhipuPayment({
    required this.paymentId,
    required this.paymentUrl,
    required this.simplifiedTransferUrl,
    required this.transferUrl,
    required this.appUrl,
    required this.readyForTerminal,
    this.notificationToken,
    this.receiverId,
    this.conciliationDate,
    this.subject,
    this.amount,
    this.currency,
    this.status,
    this.statusDetail,
    this.body,
    this.pictureUrl,
    this.receiptUrl,
    this.returnUrl,
    this.cancelUrl,
    this.notifyUrl,
    this.notifyApiVersion,
    this.expiresDate,
    this.attachmentUrls,
    this.bank,
    this.bankId,
    this.payerName,
    this.payerEmail,
    this.personalIdentifier,
    this.bankAccountNumber,
    this.outOfDateConciliation,
    this.transactionId,
    this.custom,
    this.responsibleUserEmail,
    this.sendReminders,
    this.sendEmail,
    this.paymentMethod,
    this.fundsSource,
    this.discount,
    this.thirdPartyAuthorizationDetails,
  });

  factory KhipuPayment.fromJson(Map<String, dynamic> json) {
    return KhipuPayment(
      paymentId: json['payment_id'],
      paymentUrl: json['payment_url'],
      simplifiedTransferUrl: json['simplified_transfer_url'],
      transferUrl: json['transfer_url'],
      appUrl: json['app_url'],
      readyForTerminal: json['ready_for_terminal'],
      notificationToken: json['notification_token'],
      receiverId: json['receiver_id'],
      conciliationDate: json['conciliation_date'],
      subject: json['subject'],
      amount: json['amount'],
      currency: json['currency'],
      status: json['status'],
      statusDetail: json['status_detail'],
      body: json['body'],
      pictureUrl: json['picture_url'],
      receiptUrl: json['receipt_url'],
      returnUrl: json['return_url'],
      cancelUrl: json['cancel_url'],
      notifyUrl: json['notify_url'],
      notifyApiVersion: json['notify_api_version'],
      expiresDate: json['expires_date'],
      attachmentUrls: List<String>.from(json['attachment_urls'] ?? []),
      bank: json['bank'],
      bankId: json['bank_id'],
      payerName: json['payer_name'],
      payerEmail: json['payer_email'],
      personalIdentifier: json['personal_identifier'],
      bankAccountNumber: json['bank_account_number'],
      outOfDateConciliation: json['out_of_date_conciliation'],
      transactionId: json['transaction_id'],
      custom: json['custom'],
      responsibleUserEmail: json['responsible_user_email'],
      sendReminders: json['send_reminders'],
      sendEmail: json['send_email'],
      paymentMethod: json['payment_method'],
      fundsSource: json['funds_source'],
      discount: json['discount'],
      thirdPartyAuthorizationDetails: json['third_party_authorization_details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_id': paymentId,
      'payment_url': paymentUrl,
      'simplified_transfer_url': simplifiedTransferUrl,
      'transfer_url': transferUrl,
      'app_url': appUrl,
      'ready_for_terminal': readyForTerminal,
      'notification_token': notificationToken,
      'receiver_id': receiverId,
      'conciliation_date': conciliationDate,
      'subject': subject,
      'amount': amount,
      'currency': currency,
      'status': status,
      'status_detail': statusDetail,
      'body': body,
      'picture_url': pictureUrl,
      'receipt_url': receiptUrl,
      'return_url': returnUrl,
      'cancel_url': cancelUrl,
      'notify_url': notifyUrl,
      'notify_api_version': notifyApiVersion,
      'expires_date': expiresDate,
      'attachment_urls': attachmentUrls,
      'bank': bank,
      'bank_id': bankId,
      'payer_name': payerName,
      'payer_email': payerEmail,
      'personal_identifier': personalIdentifier,
      'bank_account_number': bankAccountNumber,
      'out_of_date_conciliation': outOfDateConciliation,
      'transaction_id': transactionId,
      'custom': custom,
      'responsible_user_email': responsibleUserEmail,
      'send_reminders': sendReminders,
      'send_email': sendEmail,
      'payment_method': paymentMethod,
      'funds_source': fundsSource,
      'discount': discount,
      'third_party_authorization_details': thirdPartyAuthorizationDetails,
    };
  }
}
