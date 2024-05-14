import 'package:e_commerce1/Features/payment/data/model/card_model.dart';
import 'package:e_commerce1/Features/payment/data/repo/payment_repo.dart';
import 'package:e_commerce1/Features/payment/presentation/manager/add_card_cubit/add_card_cubit.dart';
import 'package:e_commerce1/Features/payment/presentation/manager/get_cards_cubit/get_cards_cubit.dart';
import 'package:e_commerce1/Features/register/presentation/view/widget/custom_bottom_button.dart';
import 'package:e_commerce1/core/resources/color_manager.dart';
import 'package:e_commerce1/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/asset_manager.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widgets/custom_toast.dart';

class AddCardScreenBody extends StatefulWidget {
  const AddCardScreenBody({Key? key}) : super(key: key);

  @override
  State<AddCardScreenBody> createState() => _AddCardScreenBodyState();
}

class _AddCardScreenBodyState extends State<AddCardScreenBody> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? cardNumber;
  String? exp;
  String? cvv;
  final List <String> _paymentMethodImage = [AssetManager.paybalImage,AssetManager.bankImage,AssetManager.masterCardImage];
  int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width - 40,
                          child: ListView.builder(
                            itemCount: _paymentMethodImage.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _selectedValue = index;
                                  });
                                },
                                child: PaymentTypeContainer(selectedValue: _selectedValue, paymentMethodImage: _paymentMethodImage,index: index),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Owner",
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Number",
                                  style: StyleManager.headLine3,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  onChanged: (value){
                                    cardNumber = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Required field';
                                    }else if(value.length < 16){
                                      return 'Min length : 16';
                                    }
                                    return null;
                                  },
                                  maxLength: 16,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width / 2 - 25,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "EXP",
                                        style: StyleManager.headLine3,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        onChanged: (value) {
                                          exp = value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Required field';
                                          }
                                          else if(value.length < 5){
                                            return 'Min length : 5';
                                          }
                                          return null;
                                        },
                                        maxLength: 5,
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
                                        "CVV",
                                        style: StyleManager.headLine3,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        onChanged: (value) {
                                          cvv = value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Required field';
                                          }else if(value.length < 3){
                                            return 'Min length : 3';
                                          }
                                          return null;
                                        },
                                        maxLength: 3,
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
                    ]
                ),
              ),
            ),
          ),
          CustomBottomButton(onPressed: (){
            if (_formKey.currentState!.validate()) {
              BlocProvider.of<AddCardCubit>(context).addCard(CardModel(name: name!,cardNumber: cardNumber!,cvv: cvv!,exp: exp!));
              showToast(message: "Added Successfully",color: Colors.green);
              GoRouter.of(context).pop();
            }
          }, text: "Add New Card")
        ],
      );

  }
}

class PaymentTypeContainer extends StatelessWidget {
  const PaymentTypeContainer({
    super.key,
    required int selectedValue,
    required List<String> paymentMethodImage, required this.index,
  }) : _selectedValue = selectedValue, _paymentMethodImage = paymentMethodImage;

  final int _selectedValue;
  final int index;
  final List<String> _paymentMethodImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width - 60) / 3,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: _selectedValue == index? ColorManager.orange :ColorManager.darkWhite,
          width: 2,
        ),
        color:_selectedValue == index? ColorManager.lightOrange :ColorManager.darkWhite,
        image: DecorationImage(image: AssetImage(_paymentMethodImage[index])),
          borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
