abstract class Mapper<E, D> {
  D toDto(E entity);

  E toEntity(D dto);
}

mixin EntityToDto<E, D> {
  D toDto(E entity);
}

mixin DtoToEntity<D, E> {
  E toEntity(D dto);
}
