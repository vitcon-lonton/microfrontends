import 'package:auth/auth.dart';

import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @Injectable()
  AuthBloc get authBloc;

  @Injectable()
  FavoritesCubit get favoritesCubit;

  @Injectable()
  OtpConfirmCubit get otpConfirmCubit;

  @Injectable()
  RegisterCubit get registerCubit;

  @Injectable()
  SignInFormBloc get signInFormBloc;

  @Injectable()
  PasswordForgetCubit get passwordForgetCubit;

  @Injectable()
  PasswordChangeCubit get passwordChangeCubit;

  @Injectable()
  PasswordUpdateCubit get passwordUpdateCubit;

  @Injectable()
  UserUpdateCubit get userUpdateCubit;

  @LazySingleton(as: IAuthFacade)
  AuthFacade get authFacade;
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// IAuthFacade get authFacade => FirebaseAuthFacade();
// @lazySingleton
// GoogleSignIn get googleSignIn => GoogleSignIn();
// @lazySingleton
// FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
// @lazySingleton
// FirebaseFirestore get firestore => FirebaseFirestore.instance;