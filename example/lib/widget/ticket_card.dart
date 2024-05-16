import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Stack(
            alignment: const Alignment(0, 0),
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: child,
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 550),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [circleWidget(),Expanded(child: Divider(
                    height: 1,color: Colors.grey[300],
                  ))
                    ,circleWidget()],
                ),
              )
            ],
          )),
        );
  }

  Widget circleWidget() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        shape: BoxShape.circle,
      ),
    );
  }
}
