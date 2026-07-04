import 'package:flutter/material.dart';



import '../../../core/constants/colors.dart';

import '../../../core/constants/motion.dart';

import '../../../core/constants/typography.dart';



/// Expandable PDP section — About, Care, Shipping & returns.

class ProductDetailAccordion extends StatefulWidget {

  const ProductDetailAccordion({

    super.key,

    required this.title,

    required this.body,

    this.initiallyExpanded = false,

    this.onActionTap,

    this.actionLabel,

  });



  final String title;

  final String body;

  final bool initiallyExpanded;

  final VoidCallback? onActionTap;

  final String? actionLabel;



  @override

  State<ProductDetailAccordion> createState() => _ProductDetailAccordionState();

}



class _ProductDetailAccordionState extends State<ProductDetailAccordion>

    with SingleTickerProviderStateMixin {

  late final AnimationController _expandCtrl;

  late final Animation<double> _fade;

  late final Animation<Offset> _slide;

  late var _expanded = widget.initiallyExpanded;



  @override

  void initState() {

    super.initState();

    _expandCtrl = AnimationController(

      vsync: this,

      duration: AppMotion.normal,

    );

    final curved = CurvedAnimation(

      parent: _expandCtrl,

      curve: AppMotion.standard,

    );

    _fade = curved;

    _slide = Tween<Offset>(

      begin: const Offset(0, -0.04),

      end: Offset.zero,

    ).animate(curved);

    if (_expanded) _expandCtrl.value = 1;

  }



  @override

  void dispose() {

    _expandCtrl.dispose();

    super.dispose();

  }



  void _toggle() {

    setState(() => _expanded = !_expanded);

    if (_expanded) {

      _expandCtrl.forward();

    } else {

      _expandCtrl.reverse();

    }

  }



  @override

  Widget build(BuildContext context) {

    return DecoratedBox(

      decoration: const BoxDecoration(

        border: Border(

          bottom: BorderSide(color: AppColors.border, width: 0.5),

        ),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          GestureDetector(

            onTap: _toggle,

            behavior: HitTestBehavior.opaque,

            child: Padding(

              padding: const EdgeInsets.symmetric(vertical: 14),

              child: Row(

                children: [

                  Expanded(

                    child: Text(

                      widget.title,

                      style: AppTypography.uiBodySM.copyWith(

                        color: AppColors.textPrimary,

                        fontWeight: FontWeight.w500,

                      ),

                    ),

                  ),

                  AnimatedRotation(

                    turns: _expanded ? 0.5 : 0,

                    duration: AppMotion.normal,

                    curve: AppMotion.standard,

                    child: const Icon(

                      Icons.expand_more,

                      size: 18,

                      color: AppColors.textMuted,

                    ),

                  ),

                ],

              ),

            ),

          ),

          AnimatedSize(

            duration: AppMotion.normal,

            curve: AppMotion.standard,

            alignment: Alignment.topCenter,

            child: _expanded

                ? FadeTransition(

                    opacity: _fade,

                    child: SlideTransition(

                      position: _slide,

                      child: Padding(

                        padding: const EdgeInsets.only(bottom: 14),

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(

                              widget.body,

                              style: AppTypography.uiBodySM.copyWith(

                                height: 1.75,

                                color: AppColors.textSecondary,

                              ),

                            ),

                            if (widget.onActionTap != null &&

                                widget.actionLabel != null) ...[

                              const SizedBox(height: 10),

                              GestureDetector(

                                onTap: widget.onActionTap,

                                behavior: HitTestBehavior.opaque,

                                child: Text(

                                  widget.actionLabel!,

                                  style: AppTypography.uiCaption.copyWith(

                                    color: AppColors.brandBurgundy,

                                    fontWeight: FontWeight.w600,

                                  ),

                                ),

                              ),

                            ],

                          ],

                        ),

                      ),

                    ),

                  )

                : const SizedBox(width: double.infinity, height: 0),

          ),

        ],

      ),

    );

  }

}


