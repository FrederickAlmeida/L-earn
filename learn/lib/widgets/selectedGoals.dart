import 'package:flutter/material.dart';

class SelectedGoals extends StatefulWidget {
  final List<String> availableGoals;
  final List<String> selectedGoals;

  SelectedGoals({
    Key? key,
    required this.availableGoals,
    required this.selectedGoals,
  }) : super(key: key);

  @override
  _SelectedGoalsState createState() => _SelectedGoalsState();
}

class _SelectedGoalsState extends State<SelectedGoals> {
  @override
  Widget build(BuildContext context) {

    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Objetivo de Aprendizado",
          style: TextStyle(fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF3C3C3C)),
        ),
        const Text(
          "Selecione os tópicos de estudo mais\nimportantes para o seu dependente",
          style: TextStyle(fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF5C5C5C))
        ),
        const SizedBox(height: 16),
        Container(
        padding: EdgeInsets.fromLTRB(8,8,8,8),
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff7A7FFF)),
          borderRadius: BorderRadius.circular(10),
        ),
        child:Wrap(
          spacing: 8.0,
          runSpacing: 0.0,
          children: widget.availableGoals.map((goal) {
            final isSelected = widget.selectedGoals.contains(goal);
            return InputChip(
              label: Text(
                goal, style: const TextStyle(
                        color: Color(0xFF4C4C4C),
                        fontSize: 12,
                        fontFamily: "Fieldwork-Geo",
                        fontWeight: FontWeight.w300
                      )
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    widget.selectedGoals.add(goal);
                  } else {
                    widget.selectedGoals.remove(goal);
                  }
                });
              },
              selectedColor: Color(0xff7A7FFF),
              deleteIcon: isSelected ? Icon(Icons.cancel) : null,
              onDeleted: isSelected
                  ? () {
                      setState(() {
                        widget.selectedGoals.remove(goal);
                      });
                    }
                  : null,
            );
          }).toList(),
        )
        )
      ],
    );
    
  }
}
