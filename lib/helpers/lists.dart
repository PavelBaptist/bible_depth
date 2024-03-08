T? tryGetListElement<T>(List<T> list, int index) {
  return index < list.length ? list[index] : null;
}
