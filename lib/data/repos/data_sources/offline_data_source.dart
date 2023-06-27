import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_c8_offline/model/source_response.dart';

class OfflineDataSource{
  Future<SourceResponseDM?> getSources(String sourceId) async{
    try {
      DocumentSnapshot<SourceResponseDM> snapshot
      = await getTabsCollection().doc(sourceId).get();
      return snapshot.data();
    }on Exception catch(e){
      return SourceResponseDM(message: "Something went wrong please try again later.");
    }

  }

  void saveSources(String sourceId, SourceResponseDM sourceResponseDM) async {
    // CollectionReference tabsCollection =
    // FirebaseFirestore.instance.collection(SourceResponseDM.collectionName);
    //
    // DocumentReference newDoc = tabsCollection.doc(sourceId);
    // newDoc.set(sourceResponseDM.toJson());

    DocumentReference<SourceResponseDM> newDoc = getTabsCollection().doc(sourceId);
    newDoc.set(sourceResponseDM);
  }

  CollectionReference<SourceResponseDM> getTabsCollection(){
    return
    FirebaseFirestore.instance.collection(SourceResponseDM.collectionName)
        .withConverter<SourceResponseDM>(
        fromFirestore: (snapshot, _) => SourceResponseDM.fromJson(snapshot.data()),
        toFirestore:  (sourcesResponse, _)=>sourcesResponse.toJson());
  }
}