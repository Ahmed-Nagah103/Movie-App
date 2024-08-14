import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

  String message;
  Failure(this.message);


@override
  // TODO: implement props
  List<Object?> get props => [message];
}
class ServerErrorFailure extends Failure{
  ServerErrorFailure(super.message);


}

class LocalDatabaseErrorFailure extends Failure{
  LocalDatabaseErrorFailure(super.message);


}