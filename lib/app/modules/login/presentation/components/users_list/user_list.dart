import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';

class UserList extends StatelessWidget {
  final List<UserEntity> data;
  final Function(UserEntity user) onTap;

  const UserList({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(data[index].name),
                onTap: () => onTap(data[index]),
              ),
            ),
          )
        : const Center(child: Text('Nenhum usuário cadastrado'));
  }
}
