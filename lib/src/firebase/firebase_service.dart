import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class FirebaseService {
  final DefaultFirebaseOptions options;

  FirebaseService(this.options);

  Future<void> init() async {
    await Firebase.initializeApp(
      name: 'flutter-best-practices',
      options: options.currentPlatform,
    );
  }
}
