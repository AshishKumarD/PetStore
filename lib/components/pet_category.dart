import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petstore/components/pet_card.dart';
import 'package:petstore/model/pet_model.dart';
import 'package:petstore/provider/pet_provider.dart';
import 'package:provider/provider.dart';

class PetCategory extends StatefulWidget {
  final String title;
  final String search;
  const PetCategory({
    super.key,
    required this.title,
    required this.search,
  });

  @override
  State<PetCategory> createState() => _PetCategoryState();
}

class _PetCategoryState extends State<PetCategory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String search = widget.search.toLowerCase();
    String title = widget.title;
    // List<PetModel> currentPet = PetProvider()
    //     .pet
    //     .where((product) =>
    //         product.category.toLowerCase().contains(title.toLowerCase()) &&
    //         (product.name.toLowerCase().contains(search) ||
    //             product.category.toLowerCase().contains(search)))
    //     .toList();
    // if (currentPet.isEmpty) {
    //   return const Scaffold();
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.035,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<PetProvider>(
            builder: (context, value, child) {
              List<PetModel> filteredPets = value.pet
                  .where((product) =>
                      product.category
                          .toLowerCase()
                          .contains(title.toLowerCase()) &&
                      (product.name.toLowerCase().contains(search) ||
                          product.category.toLowerCase().contains(search)))
                  .toList();
              if (filteredPets.isEmpty) {
                return const Text('No Pets Found');
              }
              return Row(
                children: filteredPets
                    .map((product) => PetCard(
                          product: product,
                        ))
                    .toList(),
              );
            },
          ),
        ),
        SizedBox(
          height: size.height * 0.020,
        ),
      ],
    );
  }
}
