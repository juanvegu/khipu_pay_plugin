final class KhipuPayment {
  String paymentId;
  String paymentUrl;
  String simplifiedTransferUrl;
  String transferUrl;
  String appUrl;
  bool readyForTerminal;
  String? notificationToken;
  int? receiverId;
  DateTime? conciliationDate;
  String? subject;
  int? amount;
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
  DateTime? expiresDate;
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
  int? discount;
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
      paymentId: json['paymentId'],
      paymentUrl: json['paymentUrl'],
      simplifiedTransferUrl: json['simplifiedTransferUrl'],
      transferUrl: json['transferUrl'],
      appUrl: json['appUrl'],
      readyForTerminal: json['readyForTerminal'],
      notificationToken: json['notificationToken'],
      receiverId: json['receiverId'],
      conciliationDate: DateTime.parse(json['conciliationDate']),
      subject: json['subject'],
      amount: json['amount'],
      currency: json['currency'],
      status: json['status'],
      statusDetail: json['statusDetail'],
      body: json['body'],
      pictureUrl: json['pictureUrl'],
      receiptUrl: json['receiptUrl'],
      returnUrl: json['returnUrl'],
      cancelUrl: json['cancelUrl'],
      notifyUrl: json['notifyUrl'],
      notifyApiVersion: json['notifyApiVersion'],
      expiresDate: DateTime.parse(json['expiresDate']),
      attachmentUrls: List<String>.from(json['attachmentUrls']),
      bank: json['bank'],
      bankId: json['bankId'],
      payerName: json['payerName'],
      payerEmail: json['payerEmail'],
      personalIdentifier: json['personalIdentifier'],
      bankAccountNumber: json['bankAccountNumber'],
      outOfDateConciliation: json['outOfDateConciliation'],
      transactionId: json['transactionId'],
      custom: json['custom'],
      responsibleUserEmail: json['responsibleUserEmail'],
      sendReminders: json['sendReminders'],
      sendEmail: json['sendEmail'],
      paymentMethod: json['paymentMethod'],
      fundsSource: json['fundsSource'],
      discount: json['discount'],
      thirdPartyAuthorizationDetails: json['thirdPartyAuthorizationDetails'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      'paymentUrl': paymentUrl,
      'simplifiedTransferUrl': simplifiedTransferUrl,
      'transferUrl': transferUrl,
      'appUrl': appUrl,
      'readyForTerminal': readyForTerminal,
      'notificationToken': notificationToken,
      'receiverId': receiverId,
      'conciliationDate': conciliationDate?.toIso8601String(),
      'subject': subject,
      'amount': amount,
      'currency': currency,
      'status': status,
      'statusDetail': statusDetail,
      'body': body,
      'pictureUrl': pictureUrl,
      'receiptUrl': receiptUrl,
      'returnUrl': returnUrl,
      'cancelUrl': cancelUrl,
      'notifyUrl': notifyUrl,
      'notifyApiVersion': notifyApiVersion,
      'expiresDate': expiresDate?.toIso8601String(),
      'attachmentUrls': attachmentUrls,
      'bank': bank,
      'bankId': bankId,
      'payerName': payerName,
      'payerEmail': payerEmail,
      'personalIdentifier': personalIdentifier,
      'bankAccountNumber': bankAccountNumber,
      'outOfDateConciliation': outOfDateConciliation,
      'transactionId': transactionId,
      'custom': custom,
      'responsibleUserEmail': responsibleUserEmail,
      'sendReminders': sendReminders,
      'sendEmail': sendEmail,
      'paymentMethod': paymentMethod,
      'fundsSource': fundsSource,
      'discount': discount,
      'thirdPartyAuthorizationDetails': thirdPartyAuthorizationDetails,
    };
  }
}