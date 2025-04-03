import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAjwtCmAXvqYnuhpoR2buqYFy46BsPlsc8",
            authDomain: "jamespharmacy-ae45f.firebaseapp.com",
            projectId: "jamespharmacy-ae45f",
            storageBucket: "jamespharmacy-ae45f.firebasestorage.app",
            messagingSenderId: "503962735919",
            appId: "1:503962735919:web:45505052b5fbb878e23dda",
            measurementId: "G-EFS372YDX5"));
  } else {
    await Firebase.initializeApp();
  }
}
