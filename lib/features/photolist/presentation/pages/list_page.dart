import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/extensions/extensions.dart';
import 'package:test_app/features/photolist/presentation/bloc/photolist_bloc.dart';
import 'package:test_app/features/photolist/presentation/widgets/photo_tile.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listScrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PhotolistBloc>().add(const GetNextPageOfPhotosEvent());
    }
  }

  bool get _isBottom {
    if (!_listScrollController.hasClients) return false;
    final maxScroll = _listScrollController.position.maxScrollExtent;
    final currentScroll = _listScrollController.position.pixels;
    return currentScroll >= (maxScroll - 100);
  }

  @override
  void dispose() {
    _listScrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotolistBloc, PhotolistState>(
      builder: (context, state) {
        if (state is PhotoListError) {
          return Center(
            child: Text(state.message),
          );
        }

        // дублирование кода - надо исправить
        if (state is PhotoListLoading || state is PhotolistInitial) {
          return CupertinoPageScaffold(
            child: CustomScrollView(
              controller: _listScrollController,
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  border: null,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  middle: Text(context.l10n.photos),
                  alwaysShowMiddle: false,
                  largeTitle: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(context.l10n.photos),
                  ),
                ),
                const SliverFillRemaining(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ],
            ),
          );
        }

        if (state is PhotoListLoaded) {
          return CupertinoPageScaffold(
            child: CustomScrollView(
              controller: _listScrollController,
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  border: null,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  middle: Text(context.l10n.photos),
                  alwaysShowMiddle: false,
                  largeTitle: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(context.l10n.photos),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(27.0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final photo = state.photos[index];
                        return PhotoTile(photo: photo);
                      },
                      childCount: state.photos.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1,
                    ),
                  ),
                ),
                if (!state.hasReachedMax)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
