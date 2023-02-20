import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen/controllers/check_in_provider.dart';

class CategoriesHeader extends StatefulWidget {
  const CategoriesHeader({Key? key}) : super(key: key);

  @override
  State<CategoriesHeader> createState() => _CategoriesHeaderState();
}

class _CategoriesHeaderState extends State<CategoriesHeader> {
  List<String> categories = ["Medications", "Appointments", "Activities"];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<CheckInProvider>().selectedIndex;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
          height: 35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: (){
                      context.read<CheckInProvider>().setSelectedIndex(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories[index],
                            style: TextStyle(fontWeight: FontWeight.bold, color: selectedIndex == index ? Colors.black : Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Container(
                              height: 2,
                              width: 30,
                              color: selectedIndex == index ? Colors.black : Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
          )),
    );
  }
}
