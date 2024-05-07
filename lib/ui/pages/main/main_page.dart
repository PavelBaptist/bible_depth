import 'package:bible_depth/core/version_handler.dart';
import 'package:bible_depth/models/fragment.dart';
import 'package:bible_depth/ui/pages/main/controller.dart';
import 'package:bible_depth/ui/svg/svgs.dart';
import 'package:bible_depth/ui/widgets/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController c = Get.put(MainPageController());

  _onTap(Fragment fragment) async {
    c.toFragment(fragment);
  }

  _onShare(Fragment fragment) async {
    c.share(fragment);
  }

  _onDelete(Fragment fragment) {
    c.delete(fragment);
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 65),
        child: Text('МОИ РАЗБОРЫ'),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => Get.toNamed('paint_test'),
          icon: const SvgIcon(SvgIcons.settings),
        ),
        const SizedBox(width: 50),
      ],
    );
  }

  Widget _buildFloating() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => Get.toNamed('new_fragment'),
    );
  }

  Widget _buildDebugInfo() {
    ThemeData style = Theme.of(Get.context!);
    return FutureBuilder(
      future: VersionHandler.getVersionFromPubspec(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'version: ${snapshot.data} | version from db: ${VersionHandler.getVersionFromDB()}',
                style: style.textTheme.bodySmall,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  ActionPane _buildTileAction(Fragment fragment) {
    return ActionPane(
      motion: const ScrollMotion(),
      extentRatio: 0.3,
      children: [
        Expanded(
          child: Align(
            child: IconButton(
              icon: const Icon(Icons.ios_share),
              onPressed: () => _onShare(fragment),
            ),
          ),
        ),
        Expanded(
          child: Align(
            child: IconButton(
              icon: const SvgIcon(SvgIcons.delete),
              onPressed: () => _onDelete(fragment),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTile(int index) {
    final fragments = c.fragmentList?.value.list ?? [];
    final fragment = fragments[index];
    return Column(
      children: [
        MyTile(
          key: Key(fragment.hashCode.toString()),
          title: fragment.name,
          onTap: () => _onTap(fragment),
          endActionPane: _buildTileAction(fragment),
        ),
        const SizedBox(height: 5.74),
      ],
    );
  }

  Widget _buildBody() {
    return Obx(
      () {
        final fragments = c.fragmentList?.value.list ?? [];
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          children: [
            const SizedBox(height: 30),
            ...List<Widget>.generate(
              fragments.length,
              _buildTile,
            ),
            _buildDebugInfo(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFloating(),
      body: _buildBody(),
    );
  }
}
