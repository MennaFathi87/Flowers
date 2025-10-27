import 'package:flowerss/views/widgets/costome_text_field_search.dart';
import 'package:flowerss/views/widgets/custome_icone.dart';
import 'package:flutter/material.dart';

class Costome_appbar extends StatelessWidget {
  const Costome_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 195,
      decoration: const BoxDecoration(
        color: Color(0xffFFD3DC),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(84),
          bottomRight: Radius.circular(84),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FLOWORA',
                  style: TextStyle(
                    color: Color(0xffCF636C),
                    fontFamily: 'Piedra',
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                  ),
                ),
                CustomeIcon(),
              ],
            ),
          ),
          CostomeTextField(),
        ],
      ),
    );
  }
}
