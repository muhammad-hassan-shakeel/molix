enum MovieSearch {
  popular,
  topRated,
  recommended,
  nowPlaying,
  all,
}

extension MovieSearchX on MovieSearch {
  String get name {
    switch (this) {
      case MovieSearch.popular:
        return 'Popular';
      case MovieSearch.topRated:
        return 'Top Rated';
      case MovieSearch.recommended:
        return 'Recommended';
      case MovieSearch.nowPlaying:
        return 'Now Playing';
      case MovieSearch.all:
        return 'All';
      default:
        return '';
    }
  }
}
