import 'package:bible_depth/feature/presentation/bloc/fragment_bloc/fragment_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/toolbar_bloc/toolbar_bloc.dart';
import 'package:bible_depth/feature/presentation/bloc/toolbar_bloc/toolbar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToolbarWidget extends StatelessWidget {
  const ToolbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      width: double.infinity,
      height: 150.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColorButtonWidget(color: Colors.green),
            ColorButtonWidget(color: Colors.red),
            ColorButtonWidget(color: Colors.yellow),
            ColorButtonWidget(color: Colors.blue),
            ColorButtonWidget(color: Colors.purple),
          ],
        ),
      ),
    );
  }
}

class ColorButtonWidget extends StatelessWidget {
  Color color;
  ColorButtonWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child:
          BlocBuilder<ToolbarBloc, ToolbarState>(builder: (context, snapshot) {
        return Container(
          width: 30,
          height: 30,
          color: color,
        );
      }),
    );
  }
}
