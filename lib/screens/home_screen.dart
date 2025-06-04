import 'package:flutter/material.dart';
import 'package:platzi_project/screens/recipe_detail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _RecipeCard(context),
          _RecipeCard(context),
          _RecipeCard(context),
          _RecipeCard(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showBottom(context);
        },

        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> showBottom(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      context: context,
      builder: (contexto) => Container(
        width: MediaQuery.of(context).size.width,
        height: 600,
        child: ReciperForm(),
      ),
    );
  }

  Widget _RecipeCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(recipeName: "Lasagna 1"),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
          elevation: 10,
          child: Row(
            children: [
              Container(
                width: 125,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://static.platzi.com/media/uploads/flutter_lasana_b894f1aee1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lasagna"),

                      Container(color: Colors.yellow, height: 10, width: 90),

                      Text("Autor: Daniel Yanez"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReciperForm extends StatelessWidget {
  const ReciperForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController autor = TextEditingController();
    final TextEditingController recipeName = TextEditingController();
    final TextEditingController picture = TextEditingController();
    final TextEditingController steps = TextEditingController();
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "Add New Recipe",
        style: TextStyle(color: Colors.deepOrange, fontSize: 20),
      ),
    );
    return Form(
      key: _formKey,

      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Permite que el modal se ajuste al contenido y teclado
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            label: "Autor",
            controller: autor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "need to input the Autor";
              }
              return null;
            },
          ),
          _buildTextField(
            label: "Recipe Name",
            controller: recipeName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "need to input the Recipe Name";
              }
              return null;
            },
          ),
          _buildTextField(
            label: "Picture",
            controller: picture,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the name recipe';
              }
              return null;
            },
          ),
          _buildTextField(
            maxLines: 4,
            label: "Recipe steps and ingredients",
            controller: steps,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "need to input the Recipe and ingredients";
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            child: Center(
              child: Text(
                "Save Recipe",
                style: TextStyle(color: const Color.fromARGB(255, 41, 41, 41)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator, // this was the issue,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontFamily: "QuickSand", color: Colors.orange),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.orange, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
