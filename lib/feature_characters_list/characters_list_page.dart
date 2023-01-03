// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/core/components/platform_activity_indicator.dart';

import 'package:rick_and_morty/core/components/app_bar/rick_and_morty_sliver_app_bar.dart';
import 'package:rick_and_morty/core/components/rick_and_morty_loading_indicator.dart';
import 'package:rick_and_morty/core/utils/snackbar.dart';
import 'package:rick_and_morty/feature_character_detail/character_detail_page.dart';
import 'package:rick_and_morty/feature_character_detail/character_detail_page_arguments.dart';
import 'package:rick_and_morty/feature_characters_list/characters_list_page_controller.dart';
import 'package:rick_and_morty/feature_characters_list/characters_list_row.dart';

import '../core/localization/app_locale.dart';

final _key = GlobalKey<NestedScrollViewState>();

// CharactersListScreen is stateful widget, because we need to add listeners
// to nested scroll controller in order to load more characters.
class CharactersListPage extends StatefulWidget {
  static const routeName = '/characters';

  const CharactersListPage({super.key});

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  @override
  void initState() {
    _initPagination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CharacterListPageController>();

    return Scaffold(
      body: NestedScrollView(
        key: _key,
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [RickAndMortySliverAppBar(title: AppLocaleKey.charactersTitle.tr)],
        body: SafeArea(
          top: false,
          child: controller.obx(
            onLoading: const RickAndMortyLoadingIndicator(),
            onError: (message) => _ErrorWidget(message: message ?? ""),
            (state) => _ContentWidget(),
          ),
        ),
      ),
    );
  }

  _initPagination() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final controller = _key.currentState?.innerController;

      if (controller != null) {
        controller.addListener(() async {
          if (controller.position.pixels + 200 > controller.position.maxScrollExtent) {
            final characterListController = Get.find<CharacterListPageController>();

            try {
              await characterListController.loadMoreCharacters();
            } catch (error) {
              showErrorSnackbar(
                error,
                context,
              );
            }
          }
        });
      }
    });
  }
}

class _ContentWidget extends GetView<CharacterListPageController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        itemCount: controller.characters.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = controller.characters[index];

          if (item.isLoding) {
            return const PlatformActivityIndicator();
          } else {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Get.toNamed(
                CharacterDetailPage.routeName,
                arguments: CharacterDetailPageArguments(item.character!),
              ),
              child: CharacterListRow(character: item.character!),
            );
          }
        },
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;

  const _ErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RickAndMortySliverAppBar(title: AppLocaleKey.charactersTitle.tr),
        SliverFillRemaining(
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
      ],
    );
  }
}
