import 'package:e_commerce1/Features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../manager/address_cubit.dart';

class AddressViewBody extends StatefulWidget {
  const AddressViewBody({Key? key}) : super(key: key);

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? country;
  String? city;
  String? number;
  String? address;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: StyleManager.headLine3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {

                          name = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorManager.darkWhite,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2 - 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Country",
                              style: StyleManager.headLine3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                country = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required field';
                                }
                                return null;
                              },
                              cursorColor: ColorManager.primary,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorManager.darkWhite,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2 - 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "City",
                              style: StyleManager.headLine3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                city = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required field';
                                }
                                return null;
                              },

                              keyboardType: TextInputType.number,
                              cursorColor: ColorManager.primary,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorManager.darkWhite,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: StyleManager.headLine3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value){
                          number = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorManager.darkWhite,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: StyleManager.headLine3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value){
                          address = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorManager.darkWhite,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Save card info",
                        style: StyleManager.headLine3,
                      ),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                        activeTrackColor: ColorManager.primary,
                        activeColor: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        CustomBottomButton(onPressed: (){
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<AddressCubit>(context).setAddressData(name: name!,
                country: country!,
                city: city!,
                number: number!,
                address: address!);
            showToast(message: "Saved Successfully",color: Colors.green);
            GoRouter.of(context).pop();
          }
              }, text: "Save Address")
      ],
    );
  }
}
