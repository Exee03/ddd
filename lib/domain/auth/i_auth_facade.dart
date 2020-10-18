import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:ddd/domain/auth/user.dart';
import 'package:ddd/domain/auth/value_objects.dart';
import 'package:ddd/domain/auth/auth_failure.dart';

abstract class IAuthFacade {
  Option<CurrentUser> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
