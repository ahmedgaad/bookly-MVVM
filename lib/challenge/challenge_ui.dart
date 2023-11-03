import 'package:bookly/challenge/custom_ticket_clipper.dart';
import 'package:bookly/challenge/custom_ticket_painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const UiChallenge());
}

class UiChallenge extends StatelessWidget {
  const UiChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Challenge(),
    );
  }
}

class Challenge extends StatelessWidget {
  const Challenge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final clipper = TicketClipper(
      borderRadius: 25,
      curveRadius: 30,
      curvePosition: MediaQuery.sizeOf(context).width / 1.86,
      curveAxis: Axis.vertical,
      direction: Directionality.of(context),
      clockwise: false,
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    fit: BoxFit.cover,
                    height: 220,
                    width: double.infinity,
                  ),
                  Container(
                    margin: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        const CustomCuponsRow(),
                        const SizedBox(height: 30),
                        CustomPaint(
                          size: const Size(double.infinity, 150),
                          painter: TicketPainter(
                            clipper: clipper,
                          ),
                          child: Container(
                            height: 150,
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'CAL0993',
                                        style: GoogleFonts.nunitoSans(
                                          color: const Color.fromARGB(
                                              255, 5, 24, 52),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right: 5, top: 8),
                                        width: 200,
                                        child: Text(
                                          'Include Express Products, a maximum of (10 to 20 riyals) limitations',
                                          style: GoogleFonts.nunitoSans(
                                            color: const Color.fromARGB(
                                                255, 66, 94, 137),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomPaint(
                                  size: const Size(0, 80),
                                  painter: LineDashedPainter(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '60%',
                                        style: GoogleFonts.nunitoSans(
                                          color: const Color.fromARGB(
                                              255, 5, 24, 52),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'OFF',
                                        style: GoogleFonts.nunitoSans(
                                          color: const Color.fromARGB(
                                              255, 5, 24, 52),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 20,
                left: 10,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
              const Positioned(
                top: 195,
                left: 12,
                right: 12,
                child: CustomProfileCard(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(61, 0, 0, 0),
            blurRadius: 6,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HungerStation',
                style: GoogleFonts.nunitoSans(
                  color: const Color.fromARGB(255, 5, 24, 52),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Food & Beverage',
                style: GoogleFonts.nunitoSans(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '+345 followers',
                style: GoogleFonts.nunitoSans(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Follow',
              style: GoogleFonts.nunitoSans(
                color: Colors.blue,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCuponsRow extends StatelessWidget {
  const CustomCuponsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'All Coupons',
            style: GoogleFonts.nunitoSans(
              color: const Color.fromARGB(255, 5, 24, 52),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ActionButton(
              icon: Icons.filter_alt_off_outlined,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            ActionButton(
              icon: Icons.sort,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            ActionButton(
              icon: Icons.category,
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.icon, this.onTap});

  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 7, 31, 66),
        ),
      ),
    );
  }
}
