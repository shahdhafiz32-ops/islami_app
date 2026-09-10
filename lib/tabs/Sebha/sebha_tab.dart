import 'package:flutter/cupertino.dart';

import '../../../app_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
   List<String> phrases = ['سبحان الله','الحمد لله','الله أكبر'];

  int phraseIndex = 0;
  int counter = 0;
  double rotationTurns = 0;

  void _onTasbeehTap() {
    setState(() {
      counter++;
      rotationTurns += 1/12;

      if (counter == 30) {
        counter = 0;
        phraseIndex = (phraseIndex + 1) % phrases.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: TextStyle(
                color: AppTheme.white,
                fontSize: 36,
                fontWeight: .w700,
              ),
              textAlign: .center,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: _onTasbeehTap,
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: .center,
                  children: [
                    Positioned(
                      top: 32,
                      child: Image.asset(
                        'assets/images/group_sebha.png',
                        height: 86,
                        width: 145,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32,right: 32),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedRotation(
                            turns: rotationTurns,
                            duration: Duration(milliseconds: 450),
                            child: Image.asset(
                              'assets/images/SebhaBody.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                child: Text(
                                  phrases[phraseIndex],
                                  textAlign: .center,
                                  style: TextStyle(
                                    color: AppTheme.white,
                                    fontSize: 36,
                                    fontWeight: .bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '$counter',
                                style: TextStyle(
                                  color: AppTheme.white,
                                  fontSize: 36,
                                  fontWeight: .bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}