# cloud_firestore_web - Bug reproduction

This is a reproduction of the Blob parsed as GeoPoint with cloud_firestore_web.

The related issue is here : https://github.com/FirebaseExtended/flutterfire/issues/3865

## Configuration

You will need a Firestore database with a document containing a Blob field. 

#### Edit the web/index.html file and add your credentials in `firebase.initializeApp`:
```html
<script>
  (() => {
    firebase.initializeApp({
      apiKey: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      authDomain: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      databaseURL: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      projectId: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      storageBucket: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      messagingSenderId: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      appId: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      measurementId: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    });
  })();
</script>
```

#### In main.dart, change the username and password : 
```dart
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: 'test_user@gmail.com',
  password: '123456789',
);
```

#### In main.dart, change the query to the document in your firestore database : 
```dart
final element = await firestoreClient.collection('items').doc('111111111111').get();
```

## Running the code
#### Build with flutter in profile mode
`flutter build web --profile`

#### Serve the content of the build/web folder with your favorite dev server
(Personnaly, I'm using the IntelliJ "Open in Browser" feature)

#### Go to the index.html in your browser and open the console
You should see this: 
```
Authenticated
Querying firestore...
Received document
Payload type:
GeoPoint
(should be Blob)
```
