import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/utils/nice_button.dart';
import 'package:page_transition/page_transition.dart';

class StartCard extends StatelessWidget {
  final String imagePath;
  final Widget route;
  final Widget oldRoute;

  const StartCard({
    super.key,
    required this.imagePath,
    required this.route,
    required this.oldRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 20, 6, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopScope<Object?>(
                  canPop: false,
                  onPopInvokedWithResult: (bool didPop, Object? result) async {
                    if (didPop) {
                      return;
                    }
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          alignment: Alignment.center,
                          child: oldRoute,
                        ),
                      );
                    }
                  },
                  child: NiceButton(
                    label: "Back",
                    color: Colors.yellow,
                    shadowColor: Colors.yellow[800]!,
                    icon: Icons.close,
                    iconSize: 30,
                    method: () {
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.center,
                            child: oldRoute,
                          ),
                        );
                      }
                    },
                  ),
                ),
                NiceButton(
                  label: "Go",
                  color: const Color.fromARGB(255, 87, 210, 91),
                  shadowColor: Colors.green[800]!,
                  icon: Icons.check_rounded,
                  iconSize: 30,
                  method: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        alignment: Alignment.center,
                        child: route,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
