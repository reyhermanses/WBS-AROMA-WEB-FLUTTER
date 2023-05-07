import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalComponent extends StatefulWidget {
  const GlobalComponent({super.key});

  @override
  State<GlobalComponent> createState() => _GlobalComponentState();
}

class _GlobalComponentState extends State<GlobalComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;
  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size, color: Color.fromARGB(255, 0, 0, 0)),
    );
  }
}

class SansWhite extends StatelessWidget {
  final text;
  final size;
  const SansWhite(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size, color: Color.fromARGB(255, 255, 255, 255)),
    );
  }
}

class SansSIlver extends StatelessWidget {
  final text;
  final size;
  const SansSIlver(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size, color: Color.fromARGB(255, 150, 150, 150)),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0)),
    );
  }
}

class SansBoldWhite extends StatelessWidget {
  final text;
  final size;
  const SansBoldWhite(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255)),
    );
  }
}

class SansBoldSilver extends StatelessWidget {
  final text;
  final size;
  const SansBoldSilver(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 167, 165, 165)),
    );
  }
}

class Montserrat extends StatelessWidget {
  final text;
  final size;
  const Montserrat(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: size, color: Color.fromARGB(255, 14, 14, 14)),
    );
  }
}

class MontserratWhite extends StatelessWidget {
  final text;
  final size;
  const MontserratWhite(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: size, color: Color.fromARGB(255, 255, 255, 255)),
    );
  }
}

class MontserratSilver extends StatelessWidget {
  final text;
  final size;
  const MontserratSilver(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: size, color: Color.fromARGB(255, 78, 77, 77)),
    );
  }
}

class MontserratBlue extends StatelessWidget {
  final text;
  final size;
  const MontserratBlue(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: size, color: Color.fromARGB(255, 43, 83, 147)),
    );
  }
}

class MontserratBold extends StatelessWidget {
  final text;
  final size;
  const MontserratBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: Color.fromARGB(255, 14, 14, 14)),
    );
  }
}

class MontserratBoldWhite extends StatelessWidget {
  final text;
  final size;
  const MontserratBoldWhite(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: Color.fromARGB(255, 255, 255, 255)),
    );
  }
}

class MontserratBoldSilver extends StatelessWidget {
  final text;
  final size;
  const MontserratBoldSilver(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: Color.fromARGB(255, 140, 138, 138)),
    );
  }
}

class MontserratBoldBlue extends StatelessWidget {
  final text;
  final size;
  const MontserratBoldBlue(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: Color.fromARGB(255, 43, 83, 147)),
    );
  }
}
