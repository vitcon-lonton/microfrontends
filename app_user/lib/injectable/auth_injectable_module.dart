import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/auth/auth.dart';

@module
abstract class AuthInjectableModule {
  @Injectable()
  AuthBloc get authBloc;

  @Injectable()
  UserCubit get user;

  @Injectable()
  SignInBloc get signIn;

  @Injectable()
  RegisterCubit get register;

  @Injectable()
  OtpConfirmCubit get otpConfirm;

  @Injectable()
  UserUpdateCubit get userUpdate;

  @Injectable()
  PasswordForgetCubit get passwordForget;

  @Injectable()
  PasswordChangeCubit get passwordChange;

  @Injectable()
  PasswordUpdateCubit get passwordUpdate;

  @Injectable()
  AuthInterceptors get authInterceptors;

  @LazySingleton(as: IAuthFacade)
  AuthFacade get authFacade;

  @LazySingleton()
  AccountApi api(Dio dio) => AccountApi(dio);
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