import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessgaeRecord extends FirestoreRecord {
  MessgaeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "profile_picture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phonenumber" field.
  String? _phonenumber;
  String get phonenumber => _phonenumber ?? '';
  bool hasPhonenumber() => _phonenumber != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  void _initializeFields() {
    _customerName = snapshotData['customer_name'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _profilePicture = snapshotData['profile_picture'] as String?;
    _message = snapshotData['message'] as String?;
    _email = snapshotData['email'] as String?;
    _phonenumber = snapshotData['phonenumber'] as String?;
    _subject = snapshotData['subject'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messgae');

  static Stream<MessgaeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessgaeRecord.fromSnapshot(s));

  static Future<MessgaeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessgaeRecord.fromSnapshot(s));

  static MessgaeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessgaeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessgaeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessgaeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessgaeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessgaeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessgaeRecordData({
  String? customerName,
  DateTime? timeCreated,
  String? profilePicture,
  String? message,
  String? email,
  String? phonenumber,
  String? subject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_name': customerName,
      'time_created': timeCreated,
      'profile_picture': profilePicture,
      'message': message,
      'email': email,
      'phonenumber': phonenumber,
      'subject': subject,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessgaeRecordDocumentEquality implements Equality<MessgaeRecord> {
  const MessgaeRecordDocumentEquality();

  @override
  bool equals(MessgaeRecord? e1, MessgaeRecord? e2) {
    return e1?.customerName == e2?.customerName &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.profilePicture == e2?.profilePicture &&
        e1?.message == e2?.message &&
        e1?.email == e2?.email &&
        e1?.phonenumber == e2?.phonenumber &&
        e1?.subject == e2?.subject;
  }

  @override
  int hash(MessgaeRecord? e) => const ListEquality().hash([
        e?.customerName,
        e?.timeCreated,
        e?.profilePicture,
        e?.message,
        e?.email,
        e?.phonenumber,
        e?.subject
      ]);

  @override
  bool isValidKey(Object? o) => o is MessgaeRecord;
}
