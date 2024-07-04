import 'package:flutter/material.dart';
import 'package:flutter_85/note_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('sayıyı çekmek istediğinde ref.watch kullan'),
             Text(ref.watch(notesProvider)[0].isDone.toString()),
            const Text('değiştirmek istediğinde ref.read kullan .notifier ekle'),
            ElevatedButton(onPressed: () {
              ref.read(notesProvider.notifier).toggleIsDone(0);

            }, child: Text('toggle')),


            const Text('fonksiyonlar note_repository.dart ta var. wp den konuşup hallederiz şimdilik taslak bir şey yaptım.'),


          ],
        ),
      ),
    );
  }
}
