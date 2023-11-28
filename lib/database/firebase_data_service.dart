import 'package:a_safe_place/Models/EventItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// FBDataService dbs = new FBDataService();
// dbs.addEvent();
//
// FBDataService.addEvent(???);

class FBDataService {
  // INITIALISE AN INSTANCE OF THE CLOUD STORE
  FirebaseFirestore db = FirebaseFirestore.instance;

  // GET ALL EVENTS
  static Future<List<EventItem>> getEvents() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await db.collection('events').get();
    final allDocs = querySnapshot.docs.map((doc) => doc.data()).toList();

    List<EventItem> itemsFromDB = [];
    for (var dataMap in allDocs) {
      if (dataMap is Map) {
        // add a type check to ensure dataMap is a Map
        DateTime dateTimeObject = dataMap['dateTime'].toDate();
        EventItem eventItem = new EventItem(dataMap['name'], dateTimeObject);
        itemsFromDB.add(eventItem);
      }
    }
    return itemsFromDB;
  }
}

//
//
// List<Event> result = [];
// // code to retrieve all events from firebase
// db.collection("users").doc("event")
//
//     .document("event")
//     .set(event)
//     .addOnSuccessListener(new OnSuccessListener<Void>() {
// @Override
// public void onSuccess(Void aVoid) {
// Log.d(TAG, "Event saved!");
//
// return result;

// ADD OR EDIT EVENT
// static Null addToDB( Event event) {
// Map<String, Object> event = new HashMap();
// FBDataService.put("event", /*controller info here?*/);
//
// // why can't this see the db?
// db.collection("users").document("event")
//     .set(event)
//     .addOnSuccessListener(new OnSuccessListener<Void>() {
// @Override
// public void onSuccess(Void aVoid) {
// Log.d(TAG, "Event saved!");
// }
// },
// )
//     .addOnFailureListener(new OnFailureListener() {
// @Override
// public void onFailure(@NonNull Exception e) {
// Log.w(TAG, "Error writing document", e);
// }
// },
// );
// }
// DELETE EVENT

// }
