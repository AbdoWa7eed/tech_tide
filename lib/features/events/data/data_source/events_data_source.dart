import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_tide/core/data/models/user/user_response_model.dart';
import 'package:tech_tide/core/network/firebase_constants.dart';
import 'package:tech_tide/features/events/data/models/event_response_model.dart';

abstract class EventsDataSource {
  Future<List<EventResponseModel>> getEvents();

  Future<bool> toggleEventGoingStatus(String eventId);
}

class EventsDataSourceImpl implements EventsDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  EventsDataSourceImpl(this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<List<EventResponseModel>> getEvents() async {
    final eventsSnapshot = await _firebaseFirestore
        .collection(FirebaseConstants.eventsCollection)
        .where(FirebaseConstants.dateTimeField,
            isGreaterThanOrEqualTo: Timestamp.now())
        .orderBy(FirebaseConstants.dateTimeField, descending: true)
        .get();

    var events = await Future.wait(eventsSnapshot.docs.map((eventDoc) async {
      var event = EventResponseModel.fromJson(eventDoc.data());

      List<dynamic> goingUserIds =
          eventDoc.data()[FirebaseConstants.goingField] ?? [];

      if (goingUserIds.isNotEmpty) {
        final usersSnapshot = await _firebaseFirestore
            .collection(FirebaseConstants.usersCollection)
            .where(FieldPath.documentId, whereIn: goingUserIds)
            .get();
        final users = usersSnapshot.docs
            .map((userDoc) => UserResponseModel.fromJson(userDoc.data()))
            .toList();
        event = event.copyWith(going: users);
      }

      return event;
    }).toList());

    return events;
  }

  @override
  Future<bool> toggleEventGoingStatus(String eventId) async {
    final userId = _firebaseAuth.currentUser!.uid;

    final eventDoc = await _firebaseFirestore
        .collection(FirebaseConstants.eventsCollection)
        .doc(eventId)
        .get();

    List<dynamic> goingUserIds =
        eventDoc.data()?[FirebaseConstants.goingField] ?? [];

    if (goingUserIds.contains(userId)) {
      await _firebaseFirestore
          .collection(FirebaseConstants.eventsCollection)
          .doc(eventId)
          .update({
        FirebaseConstants.goingField: FieldValue.arrayRemove([userId])
      });
      return false;
    } else {
      await _firebaseFirestore
          .collection(FirebaseConstants.eventsCollection)
          .doc(eventId)
          .update({
        FirebaseConstants.goingField: FieldValue.arrayUnion([userId])
      });
      return true;
    }
  }
}
