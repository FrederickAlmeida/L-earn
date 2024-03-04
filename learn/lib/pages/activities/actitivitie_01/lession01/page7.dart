import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';

int certa = 2;

class CustomRadioTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  const CustomRadioTile({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the background and border color based on the selection and correctness.
    Color backgroundColor = Colors.transparent;
    Color borderColor = const Color(0xFFB6B6B6);
    Color checkIconColor = const Color(0xFFB6B6B6);

    if (isSelected) {
      borderColor = isCorrect
          ? Colors.green
          : const Color(0xFFFFA200); // Green for correct, orange for incorrect.
      backgroundColor = Colors.transparent; // No border when selected.
      checkIconColor = isCorrect
          ? Colors.green
          : const Color(0xFFFFA200); // White checkmark when selected.
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.91, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor, width: 0.75),
        ),
        child: Row(
          children: [
            isSelected
                ? Icon(Icons.check_circle, color: checkIconColor)
                : const Icon(Icons.radio_button_unchecked,
                    color: Color(0xFFB6B6B6)),
            const SizedBox(width: 18.2),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.white : const Color(0xFFB6B6B6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page07 extends StatefulWidget {
  final PageController pageController;

  Page07({required this.pageController});

  @override
  _Page05State createState() => _Page05State();
}

class _Page05State extends State<Page07> {
  int selecionada = -1; // This variable is now part of the state

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "Fieldwork-Geo");

    double bottomPadding = MediaQuery.of(context).size.height *
        0.1; // Adjust the multiplier as needed

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0XFF7A7FFF),
                Color(0XFF040862),
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 64,
                ),
                LearnBackButton(
                  buttonColor: const Color(0xFFFFFFFF),
                  iconColor: const Color(0xff101573),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                const SizedBox(
                  height: 48,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'A Connie não tem certeza do que vai estar com vontade de comer durante o filme, mas quer um lanche delicioso e quer também ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Fieldwork-Geo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: "economizar no passeio.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Fieldwork-Geo",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                // This would be a custom widget to display the question and options
                _buildQuestion(context),
              ],
            ),
          ),
          // alguém aqui depois coloca padding de porcentagem, pq eu n sei fazer

          Positioned(
            bottom:
                bottomPadding, // Adjust this value to move the buttons up or down
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Keep the horizontal padding if needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // This will place space evenly between your buttons
                children: [
                  LearnButton(
                    text: const Text(
                      "Voltar",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Fieldwork-Geo",
                      ),
                    ),
                    buttonColor: Color.fromARGB(0, 255, 255, 255),
                    onPressed: () {
                      widget.pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                  ),
                  const Spacer(),
                  LearnButton(
                    text: const Text(
                      "Continuar",
                      style: TextStyle(
                        color: Color(0xff101573),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Fieldwork-Geo",
                      ),
                    ),
                    buttonColor: const Color(0xFFFFFFFF),
                    onPressed: () {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(BuildContext context) {
    // Replace with your custom question widget
    return Positioned(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 16.0),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Qual opção de lanchonete ela deveria escolher?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Placeholder for options, you should replace this with your own custom widget
          ...List.generate(3, (index) => _buildOption(index, context)),
        ],
      ),
    );
  }

  Widget _buildOption(int index, BuildContext context) {
    // Define the options text based on the index
    String optionText = "";
    switch (index) {
      case 0:
        optionText =
            "Lanchonete 1 (\$\$\$): Vende comidinhas artesanais e deliciosas que custam entre R\$40 e R\$60";
        break;
      case 1:
        optionText =
            "Lanchonete 2 (\$): Vende comidinhas que às vezes não estão tão boas, mas que custam R\$10 e R\$20";
        break;
      case 2:
        optionText =
            "Lanchonete 3(\$\$): Vende comidinhas bonitas e deliciosas que custam entre R\$20 e R\$40";
        break;
      default:
        optionText =
            "Opção $index"; // Default text in case more options are added
    }

    TextStyle optionTextStyle = TextStyle(
      color: const Color.fromARGB(0, 255, 255, 255),
      fontSize: 18,
    );

    bool isCorrect =
        index == certa; // This checks if the option is the correct one.

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: 105,
        child: CustomRadioTile(
          title: optionText,
          isSelected: selecionada == index,
          isCorrect: isCorrect, // Pass the correctness condition.
          onTap: () {
            setState(() {
              selecionada = index;
            });
          },
        ),
      ),
    );
  }
}