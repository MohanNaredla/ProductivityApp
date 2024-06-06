import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  signInWithGoogle() async {
    //sign in popup
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();

    //obtain details
    final GoogleSignInAuthentication auth = await user!.authentication;

    //create credential
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithGit() async {
    GithubAuthProvider provider = GithubAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(provider);
  }
}
