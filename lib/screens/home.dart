import 'package:complex/screens/providers/complex_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 // Adjust the path if needed

class ComplexListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complexListState = ref.watch(complexListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Complex Data List', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: complexListState.when(
        data: (complexList) {
          return ListView.builder(
            itemCount: complexList.length,
            itemBuilder: (context, index) {
              final complex = complexList[index];
              return ListTile(
                title: Text(complex.name ?? "No Name"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username: ${complex.username ?? ''}"),
                    Text("Email: ${complex.email ?? ''}"),
                    Text("Phone: ${complex.phone ?? ''}"),
                    Text("Website: ${complex.website ?? ''}"),
                    if (complex.company != null)
                      Text("Company: ${complex.company!.name}"),
                    if (complex.address != null)
                      Text("City: ${complex.address!.city ?? ''}"),
                  ],
                ),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
