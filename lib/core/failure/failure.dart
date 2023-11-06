import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError){
     switch(dioError.type){
       case DioErrorType.connectionTimeout :
       return ServerFailure("Connection Timeout with Api Server");

       case DioErrorType.sendTimeout :

         return ServerFailure("send Timeout with Api Server");
       case DioErrorType.receiveTimeout :

         return ServerFailure("receive Timeout with Api Server");
       case DioErrorType.badResponse :

         return ServerFailure.fromResponse(dioError.response!.statusCode!,dioError.response!.data);

       case DioErrorType.badCertificate:
         return ServerFailure("incorrect certificate");

       case DioErrorType.cancel :

         return ServerFailure("cancel request with Api Server");

       case DioErrorType.connectionError :

         return ServerFailure("connection Error");

       case DioErrorType.unknown :
         if (dioError.message!.contains('SocketException')) {
           return ServerFailure("No Internet Connection");
         }
         return ServerFailure("Opps There was an error ");
         default:
           return ServerFailure("Opps There was an error ");

     }
  }

  factory ServerFailure.fromResponse(int statusCode,dynamic response){
    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      return ServerFailure(response['error']['message']);
    }
    else if (statusCode == 404){
      return ServerFailure('your request not found, please try again');
    }
    else if (statusCode == 404){
      return ServerFailure('Internal server error, please try again');
    }else{
      return ServerFailure('Opps There was an error');
    }
  }
}
