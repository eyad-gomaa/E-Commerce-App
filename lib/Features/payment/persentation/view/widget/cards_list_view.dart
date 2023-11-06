import 'package:flutter/material.dart';

class CardsListView extends StatelessWidget {
  const CardsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                Image.asset("assets/images/visa_card.png"),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30,left: 20),
                      child: Text("Eyad Gomaa",style: TextStyle(color: Colors.white),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50,left: 20),
                      child: Text("Visa Classic",style: TextStyle(color: Colors.white),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10,left: 20),
                      child: Text("5 2 5 4 * * * *  * * * * 7 6 9 0",style: TextStyle(color: Colors.white),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10,left: 20),
                      child: Text("\$3,763.87",style: TextStyle(color: Colors.white),

                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}