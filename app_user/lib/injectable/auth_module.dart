import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/auth/auth.dart';

@module
abstract class AuthModule {
  @LazySingleton()
  AccountApi api(Dio dio) => AccountApi(dio);

  @LazySingleton(as: IAuthFacade)
  AuthFacade get authFacade;

  @Injectable()
  AuthBloc get authBloc;

  @Injectable()
  UserCubit get userCubit;

  @Injectable()
  SignInBloc get signInBloc;

  @Injectable()
  RegisterCubit get registerCubit;

  @Injectable()
  FavoritesCubit get favoritesCubit;

  @Injectable()
  OtpConfirmCubit get otpConfirmCubit;

  @Injectable()
  UserUpdateCubit get userUpdateCubit;

  @Injectable()
  PasswordForgetCubit get passwordForgetCubit;

  @Injectable()
  PasswordChangeCubit get passwordChangeCubit;

  @Injectable()
  PasswordUpdateCubit get passwordUpdateCubit;

  @Injectable()
  AuthInterceptors get authInterceptors;
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