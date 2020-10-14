import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: 'test_user@gmail.com',
    password: '123456789',
  );

  print('Authenticated');
  final FirebaseFirestore firestoreClient = FirebaseFirestore.instance;

  print('Querying firestore...');
  final element = await firestoreClient.collection('items').doc('111111111111').get();

  print('Received document');
  final payload = element.data()['Payload'];
  print('Payload type:');
  print(payload.runtimeType);
  print('(should be Blob)');
}
