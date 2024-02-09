import 'package:flutter/material.dart';
import 'package:petstore/model/history_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryItem extends StatefulWidget {
  final HistoryItemModel historyItem;

  const HistoryItem({
    super.key,
    required this.historyItem,
  });

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.30,
            height: size.height * 0.13,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Image.network(
                widget.historyItem.petModel.image,
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.historyItem.petModel.name,
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  "\$${widget.historyItem.petModel.price}",
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.035,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.030,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
