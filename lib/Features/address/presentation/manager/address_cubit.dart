
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  String? name;
  String? country;
  String? city;
  String? number;
  String? address;

  setAddressData({required String name,required String country,required String city,required String number,required String address }){
    this.name = name;
    this.country = country;
    this.city = city;
    this.number = number;
    this.address = address;
    emit(AddAddressSuccess());
  }
}
