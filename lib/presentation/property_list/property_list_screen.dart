import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/property_repository.dart';
import '../common_widgets/property_card.dart';
import 'cubit/property_list_cubit.dart';

class PropertyListScreen extends StatelessWidget {
  const PropertyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      PropertyListCubit(RepositoryProvider.of<PropertyRepository>(context))
        ..loadProperties(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Real Estate Properties'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<PropertyListCubit, PropertyListState>(
          builder: (context, state) {
            if (state is PropertyListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PropertyListLoaded) {
              if (state.properties.isEmpty) {
                return const Center(child: Text('No properties found.'));
              }
              return ListView.builder(
                itemCount: state.properties.length,
                itemBuilder: (context, index) {
                  final property = state.properties[index];
                  return PropertyCard(property: property);
                },
              );
            } else if (state is PropertyListError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.message}', textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<PropertyListCubit>().loadProperties();
                        },
                        child: const Text('Retry'),
                      )
                    ],
                  ),
                ),
              );
            }
            return const Center(child: Text('Please wait...')); // Initial or unknown state
          },
        ),
      ),
    );
  }
}