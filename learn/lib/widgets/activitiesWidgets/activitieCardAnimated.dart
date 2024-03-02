import 'package:flutter/material.dart';
import 'package:learn/widgets/activitiesWidgets/activitieCardStatic.dart';
import 'package:learn/pages/activities/activitieMain.dart';

class ActivitieCard extends StatefulWidget {
  final ActivitieCardStatic activitie;
  final bool isActivitie;

  ActivitieCard({
    required this.activitie,
    this.isActivitie = false
  });

  @override
  _ActivitieCardState createState() => _ActivitieCardState();
}

class _ActivitieCardState extends State<ActivitieCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150), // Um pouco mais rápido para um "pulo"
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1)
      .animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut, // Começa rápido e termina lentamente
          reverseCurve: Curves.easeIn, // Começa lentamente e termina rápido
        ),
      );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    if (!widget.activitie.isLocked) {
      if (widget.activitie.isActivitie){
          print("Teste2");
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => ActivitieMain(content: widget.activitie)?? Container())
          );
        }
      else if (widget.activitie.pageWidget != null){
        print("Teste1");
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget.activitie.pageWidget ?? Container())
        );
      }
    }
    _animationController
      .forward()
      .then((_) => _animationController.reverse()); // Faz a animação "pulo"
  }

  @override
  Widget build(BuildContext context) {
    widget.activitie.isActivitie = widget.isActivitie;
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            alignment: Alignment.center, // Garante que a escala é do centro
            child: child,
          );
        },
        child: widget.activitie,
      ),
    );
  }
}