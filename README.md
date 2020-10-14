# cloud_firestore_web - Bug reproduction

This is a reproduction of the Blob parsed as GeoPoint with cloud_firestore_web

## Configuration

You will need a Firestore database with a document containing a Blob field. 

Edit the web/index.html file and add your credentials in
`firebase.initializeApp`:
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

In main.dart, change the username and password : 
```dart
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: 'test_user@gmail.com',
  password: '123456789',
);
```
