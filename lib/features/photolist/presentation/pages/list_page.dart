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
  bool _scroolEnabled = true;

  @override
  void initState() {
    super.initState();
    _listScrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom && _scroolEnabled) {
      context.read<PhotoListBloc>().add(const GetNextPageOfPhotosEvent());
    }
  }

  bool get _isBottom {
    if (!_listScrollController.hasClients) return false;
    final maxScroll = _listScrollController.position.maxScrollExtent;
    final currentScroll = _listScrollController.position.pixels;
    return currentScroll >= (maxScroll - 50);
  }

  @override
  void dispose() {
    _listScrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  Widget _buildAppBar(BuildContext context) {
    return CupertinoSliverNavigationBar(
      border: null,
      backgroundColor: Colors.white.withOpacity(0.5),
      middle: Text(
        context.l10n.photos,
        style: context.text.mediumTitle,
      ),
      alwaysShowMiddle: false,
      largeTitle: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          context.l10n.photos,
          style: context.text.largeTitle,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<PhotoListBloc, PhotoListState>(
      buildWhen: (previous, current) {
        return !(current is PhotoListNextPageLoading &&
            previous is PhotoListLoaded);
      },
      builder: (context, state) {
        if (state is PhotoListFirstPageError) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.message, style: context.text.mediumTitle),
              IconButton(
                onPressed: () {
                  context
                      .read<PhotoListBloc>()
                      .add(const GetFirstPageOfPhotosEvent());
                },
                icon: Icon(
                  Icons.refresh,
                  size: 30,
                  color: context.color.primaryText,
                ),
              )
            ],
          ));
        }

        if (state is PhotoListEmpty) {
          return Center(
            child: Text(state.message, style: context.text.mediumTitle),
          );
        }

        if (state is PhotoListFirstPageLoading) {
          return CustomScrollView(
            controller: _listScrollController,
            slivers: <Widget>[
              _buildAppBar(context),
              const SliverFillRemaining(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ],
          );
        }

        if (state is PhotoListLoaded ||
            state is PhotoListNextPageError ||
            state is PhotoListAllLoaded) {
          final photos = state is PhotoListLoaded
              ? state.photos
              : state is PhotoListNextPageError
                  ? state.photos
                  : (state as PhotoListAllLoaded).photos;
          return CustomScrollView(
            controller: _listScrollController,
            slivers: <Widget>[
              _buildAppBar(context),
              SliverPadding(
                padding: const EdgeInsets.all(27.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final photo = photos[index];
                      return PhotoTile(
                        photo: photo,
                        onTap: () {
                          context
                              .read<PhotoListBloc>()
                              .add(OpenDetailPageEvent(photo: photo));
                        },
                      );
                    },
                    childCount: photos.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1,
                  ),
                ),
              ),
              if (state is PhotoListNextPageError)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Center(
                        child: IconButton(
                      onPressed: () {
                        context
                            .read<PhotoListBloc>()
                            .add(const GetNextPageOfPhotosEvent());
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 30,
                        color: context.color.primaryText,
                      ),
                    )),
                  ),
                )
              else if (state is! PhotoListAllLoaded)
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
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PhotoListBloc, PhotoListState>(
        listener: (context, state) {
          if (state is PhotoListNextPageError) {
            _scroolEnabled = false;
            if (ScaffoldMessenger.of(context).mounted) {
              ScaffoldMessenger.of(context).clearSnackBars();
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: context.text.mediumLikes,
                ),
                backgroundColor: context.color.primaryBackground,
              ),
            );
          } else if (state is PhotoListLoaded) {
            _scroolEnabled = true;
          }
        },
        child: _buildBody(context),
      ),
    );
  }
}
