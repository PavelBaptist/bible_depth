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
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ToolbarBloc toolbarBloc = BlocProvider.of<ToolbarBloc>(context);
        toolbarBloc
            .add(ToolbarSelectToolEvent(currentTool: selected ? null : color));
      },
      child: BlocBuilder<ToolbarBloc, ToolbarState>(
          builder: (context, toolbarState) {
        if (toolbarState is ToolbarSelectedToolState) {
          selected = color == toolbarState.currentTool;
        }

        return Container(
          width: selected ? 10 : 30,
          height: selected ? 10 : 30,
          color: color,
        );
      }),
    );
  }
}
