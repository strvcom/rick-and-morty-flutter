import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/core/components/platform_activity_indicator.dart';

import 'package:rick_and_morty/core/components/app_bar/rick_and_morty_sliver_app_bar.dart';
import 'package:rick_and_morty/core/components/rick_and_morty_loading_indicator.dart';
import 'package:rick_and_morty/core/localization/app_locale.dart';
import 'package:rick_and_morty/features/character_detail/character_detail_page.dart';
import 'package:rick_and_morty/features/character_detail/character_detail_page_arguments.dart';
import 'package:rick_and_morty/features/characters_list/components/characters_list_row_widget.dart';
import 'package:rick_and_morty/features/characters_list/model/character_list_item.dart';

final _key = GlobalKey<NestedScrollViewState>();

class CharactersListPage extends StatelessWidget {
  static const routeName = '/characters';

  const CharactersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        key: _key,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          RickAndMortySliverAppBar(title: AppLocaleKey.charactersTitle.tr),
        ],
        body: const RickAndMortyLoadingIndicator(),
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification && notification.metrics.extentAfter < 50) {
          // ToDo: Load more characters and show snackabr on Error.
        }

        return false;
      },
      child: ListView.separated(
        itemCount: 0,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = CharacterListItem();

          if (item.isLoding) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: PlatformActivityIndicator(),
              ),
            );
          } else {
            return CharacterListRowWidget(
              character: item.character!,
              onTap: () => Get.toNamed(
                CharacterDetailPage.routeName,
                arguments: CharacterDetailPageArguments(item.character!),
              ),
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
