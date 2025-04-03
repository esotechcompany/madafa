import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PractiseAreasRecord extends FirestoreRecord {
  PractiseAreasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "shortDesc" field.
  String? _shortDesc;
  String get shortDesc => _shortDesc ?? '';
  bool hasShortDesc() => _shortDesc != null;

  // "longDesc" field.
  String? _longDesc;
  String get longDesc => _longDesc ?? '';
  bool hasLongDesc() => _longDesc != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "timeadded" field.
  DateTime? _timeadded;
  DateTime? get timeadded => _timeadded;
  bool hasTimeadded() => _timeadded != null;

  // "one" field.
  bool? _one;
  bool get one => _one ?? false;
  bool hasOne() => _one != null;

  // "two" field.
  bool? _two;
  bool get two => _two ?? false;
  bool hasTwo() => _two != null;

  // "four" field.
  bool? _four;
  bool get four => _four ?? false;
  bool hasFour() => _four != null;

  // "five" field.
  bool? _five;
  bool get five => _five ?? false;
  bool hasFive() => _five != null;

  // "three" field.
  bool? _three;
  bool get three => _three ?? false;
  bool hasThree() => _three != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _shortDesc = snapshotData['shortDesc'] as String?;
    _longDesc = snapshotData['longDesc'] as String?;
    _image = snapshotData['image'] as String?;
    _timeadded = snapshotData['timeadded'] as DateTime?;
    _one = snapshotData['one'] as bool?;
    _two = snapshotData['two'] as bool?;
    _four = snapshotData['four'] as bool?;
    _five = snapshotData['five'] as bool?;
    _three = snapshotData['three'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('practiseAreas');

  static Stream<PractiseAreasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PractiseAreasRecord.fromSnapshot(s));

  static Future<PractiseAreasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PractiseAreasRecord.fromSnapshot(s));

  static PractiseAreasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PractiseAreasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PractiseAreasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PractiseAreasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PractiseAreasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PractiseAreasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPractiseAreasRecordData({
  String? name,
  String? shortDesc,
  String? longDesc,
  String? image,
  DateTime? timeadded,
  bool? one,
  bool? two,
  bool? four,
  bool? five,
  bool? three,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'shortDesc': shortDesc,
      'longDesc': longDesc,
      'image': image,
      'timeadded': timeadded,
      'one': one,
      'two': two,
      'four': four,
      'five': five,
      'three': three,
    }.withoutNulls,
  );

  return firestoreData;
}

class PractiseAreasRecordDocumentEquality
    implements Equality<PractiseAreasRecord> {
  const PractiseAreasRecordDocumentEquality();

  @override
  bool equals(PractiseAreasRecord? e1, PractiseAreasRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.shortDesc == e2?.shortDesc &&
        e1?.longDesc == e2?.longDesc &&
        e1?.image == e2?.image &&
        e1?.timeadded == e2?.timeadded &&
        e1?.one == e2?.one &&
        e1?.two == e2?.two &&
        e1?.four == e2?.four &&
        e1?.five == e2?.five &&
        e1?.three == e2?.three;
  }

  @override
  int hash(PractiseAreasRecord? e) => const ListEquality().hash([
        e?.name,
        e?.shortDesc,
        e?.longDesc,
        e?.image,
        e?.timeadded,
        e?.one,
        e?.two,
        e?.four,
        e?.five,
        e?.three
      ]);

  @override
  bool isValidKey(Object? o) => o is PractiseAreasRecord;
}
