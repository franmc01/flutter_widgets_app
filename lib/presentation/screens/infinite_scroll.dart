import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController _scrollController = ScrollController();
  List<int> _imageIds = [1, 2, 3, 4, 5];
  bool _isLoading = false;
  bool _isMounted = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isMounted = false;
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels + 500 >= _scrollController.position.maxScrollExtent) {
      _loadMoreImages();
    }
  }

  Future<void> _loadMoreImages() async {
    if (_isLoading || !_isMounted) return;

    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));

    if (!_isMounted) return;

    _addFiveImages();
    _setLoading(false);
    _moveScrollToBottom();
  }

  Future<void> _refreshImages() async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 3));

    if (!_isMounted) return;

    final lastId = _imageIds.last;
    setState(() {
      _imageIds = [lastId + 1];
      _addFiveImages();
    });

    _setLoading(false);
  }

  void _setLoading(bool value) {
    if (!_isMounted) return;
    setState(() {
      _isLoading = value;
    });
  }

  void _moveScrollToBottom() {
    if (_scrollController.position.pixels + 100 <= _scrollController.position.maxScrollExtent) return;

    _scrollController.animateTo(
      _scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn,
    );
  }

  void _addFiveImages() {
    final lastId = _imageIds.last;
    setState(() {
      _imageIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: _refreshImages,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _imageIds.length,
            itemBuilder: _buildImageItem,
          ),
        ),
      ),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: () => context.pop(),
      child: _isLoading
          ? SpinPerfect(infinite: true, child: const Icon(Icons.refresh_rounded))
          : const Icon(Icons.arrow_back_ios_new_outlined),
    );
  }

  Widget _buildImageItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FadeInImage(
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://picsum.photos/id/${_imageIds[index]}/500/300'),
          imageErrorBuilder: (context, error, stackTrace) => const Center(
            child: Icon(Icons.error, color: Colors.red, size: 50)
          ),
        ),
      ),
    );
  }
}
