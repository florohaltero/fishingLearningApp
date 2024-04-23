import 'package:angelschein_lernen/feature/category/category_controller.dart';
import 'package:angelschein_lernen/feature/category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:formigas_mvc/formigas_mvc.dart';

class CategoryView extends MViewC<CategoryController, List<CategoryModel>> {
  const CategoryView({
    required super.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context, List<CategoryModel> model) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Scaffold(
          appBar: AppBar(
            title: const Text('Angle wie eh Profi'),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              //controller.loadCategories();
            },
          ),
          body: controller.model.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  padding: const EdgeInsets.all(10),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: controller.model.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.model[index].title),
                      subtitle: Text(controller.model[index].description),

                      //selectedTileColor: Colors.red,
                      onTap: () => controller.selectCategory(context, index),
                      //selected: _selectedIndex == index,
                      contentPadding: const EdgeInsets.all(10),
                      tileColor: Colors.blueAccent.withAlpha(100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton(
          //onPressed: controller.loadCategories,
          tooltip: 'Increment',
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      );
}
