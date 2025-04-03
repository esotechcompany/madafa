import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestmoniesRecord extends FirestoreRecord {
  TestmoniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "customer_title" field.
  String? _customerTitle;
  String get customerTitle => _customerTitle ?? '';
  bool hasCustomerTitle() => _customerTitle != null;

  // "profile_picture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "timeadded" field.
  DateTime? _timeadded;
  DateTime? get timeadded => _timeadded;
  bool hasTimeadded() => _timeadded != null;

  void _initializeFields() {
    _customerName = snapshotData['customer_name'] as String?;
    _customerTitle = snapshotData['customer_title'] as String?;
    _profilePicture = snapshotData['profile_picture'] as String?;
    _description = snapshotData['description'] as String?;
    _title = snapshotData['title'] as String?;
    _timeadded = snapshotData['timeadded'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testmonies');

  static Stream<TestmoniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestmoniesRecord.fromSnapshot(s));

  static Future<TestmoniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestmoniesRecord.fromSnapshot(s));

  static TestmoniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestmoniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestmoniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestmoniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestmoniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestmoniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestmoniesRecordData({
  String? customerName,
  String? customerTitle,
  String? profilePicture,
  String? description,
  String? title,
  DateTime? timeadded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'customer_name': customerName,
      'customer_title': customerTitle,
      'profile_picture': profilePicture,
      'description': description,
      'title': title,
      'timeadded': timeadded,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestmoniesRecordDocumentEquality implements Equality<TestmoniesRecord> {
  const TestmoniesRecordDocumentEquality();

  @override
  bool equals(TestmoniesRecord? e1, TestmoniesRecord? e2) {
    return e1?.customerName == e2?.customerName &&
        e1?.customerTitle == e2?.customerTitle &&
        e1?.profilePicture == e2?.profilePicture &&
        e1?.description == e2?.description &&
        e1?.title == e2?.title &&
        e1?.timeadded == e2?.timeadded;
  }

  @override
  int hash(TestmoniesRecord? e) => const ListEquality().hash([
        e?.customerName,
        e?.customerTitle,
        e?.profilePicture,
        e?.description,
        e?.title,
        e?.timeadded
      ]);

  @override
  bool isValidKey(Object? o) => o is TestmoniesRecord;
}
