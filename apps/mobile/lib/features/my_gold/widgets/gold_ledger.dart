import 'package:flutter/material.dart';



import '../../../core/animations/staggered_list_item.dart';

import '../../../core/constants/colors.dart';

import '../../../core/constants/spacing.dart';

import '../../../core/constants/typography.dart';

import '../../../core/models/gold_balance.dart';



class GoldLedgerList extends StatelessWidget {

  const GoldLedgerList({super.key, required this.entries});



  final List<GoldLedgerEntry> entries;



  @override

  Widget build(BuildContext context) {

    if (entries.isEmpty) {

      return Text(

        'No ledger entries yet.',

        style: AppTypography.uiBodySM.copyWith(color: AppColors.slateMist),

      );

    }



    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text('Gold ledger', style: AppTypography.headingSM),

        const SizedBox(height: AppSpacing.sm),

        for (var i = 0; i < entries.length; i++)

          StaggeredListItem(

            index: i,

            baseDelay: const Duration(milliseconds: 40),

            child: ListTile(

              contentPadding: EdgeInsets.zero,

              title: Text(entries[i].entryType.replaceAll('_', ' ')),

              subtitle: Text(entries[i].postedAt.split('T').first),

              trailing: Text('+${entries[i].gramsDelta}g'),

            ),

          ),

      ],

    );

  }

}


