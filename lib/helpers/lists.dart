T? tryGetListElement<T>(List<T> list, int index) {
  return index < list.length && index > 0 ? list[index] : null;
}
