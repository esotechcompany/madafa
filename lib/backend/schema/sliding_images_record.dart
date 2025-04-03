import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SlidingImagesRecord extends FirestoreRecord {
  SlidingImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "timeAdded" field.
  DateTime? _timeAdded;
  DateTime? get timeAdded => _timeAdded;
  bool hasTimeAdded() => _timeAdded != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _timeAdded = snapshotData['timeAdded'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('slidingImages');

  static Stream<SlidingImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SlidingImagesRecord.fromSnapshot(s));

  static Future<SlidingImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SlidingImagesRecord.fromSnapshot(s));

  static SlidingImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SlidingImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SlidingImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SlidingImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SlidingImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SlidingImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSlidingImagesRecordData({
  String? image,
  DateTime? timeAdded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'timeAdded': timeAdded,
    }.withoutNulls,
  );

  return firestoreData;
}

class SlidingImagesRecordDocumentEquality
    implements Equality<SlidingImagesRecord> {
  const SlidingImagesRecordDocumentEquality();

  @override
  bool equals(SlidingImagesRecord? e1, SlidingImagesRecord? e2) {
    return e1?.image == e2?.image && e1?.timeAdded == e2?.timeAdded;
  }

  @override
  int hash(SlidingImagesRecord? e) =>
      const ListEquality().hash([e?.image, e?.timeAdded]);

  @override
  bool isValidKey(Object? o) => o is SlidingImagesRecord;
}
