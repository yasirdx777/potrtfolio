import 'package:flutter/material.dart';
import 'work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Lead Mobile Applications Developer At iQ Network. Suli,IQ",
          subTitle:
              "Where I led a team of mobile applications developers to develop enterprise applications with scalability in mind, \nthe applications include FTTH and 4G LTE self-care systems, media stream platform, and health care applications.",
          duration: "Aug - 2019 to Present",
        ),
        WorkCustomData(
          title: "iOS Applications Developer At XBand. Baghdad, IQ",
          subTitle:
              "Where I worked as a freelance to develop multiple applications like food delivery, blog, \nand clinic appointment booking system.",
          duration: "Mar - 2021 to Nov - 2021",
        ),
        WorkCustomData(
          title: "iOS Applications Developer At Crocxi. Baghdad, IQ",
          subTitle:
              "Where I developed several applications including e-commerce, airline ticket system, \nsand medical delegate system application.",
          duration: "Jan - 2019 to Aug - 2019",
        ),
        WorkCustomData(
          title: "Desktop Applications Developer At Trend. Baghdad, IQ",
          subTitle:
              "Where I developed several sale point system applications, That allow creating \na custom receipt depending on customer preferences requests with image support, \nThe system also includes inventory management and sales reports.",
          duration: "Mar - 2018 to Jan - 2019",
        ),
      ],
    );
  }
}
