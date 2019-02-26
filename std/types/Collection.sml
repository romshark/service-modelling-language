# Collection represents a paginable collection of entities
type std::Collection<@T>

parameters {
	$ids    ?Array<ID<@T>>
	$after  ?ID<@T>
	$before ?ID<@T>
	$limit  ?Int32
}

attributes {
	*predicate ?function (@T) Bool |> select { case ($ == nil) = ($x) => true }
	*order     ?Order
	*orderBy   ?(Selector<@T> or Array<Selector<@T>>)
}

value Array<@T> = select {
	case ($ids != nil) = find<@T>(
		($t) => $t:id in $ids and *predicate($t),
		*order,
		*orderBy,
		$limit
	)
	case ($after != nil) = find<@T>(
		($t) => $t:id > $after and *predicate($t),
		*order,
		*orderBy,
		$limit
	)
	case ($before != nil) = find<@T>(
		($t) => $t:id < $before and *predicate($t),
		*order,
		*orderBy,
		negate($limit)
	)
	default = []
}

hiddenProperties {
	lenght  Uint32 = count(Type<@T>)
	version ID = collectionVersion(Type<@T>)
}

constraints {
	require @T entity

	require ($ids, $limit, $after, $before) => select {
		case ($ids == nil) = $limit != nil and ($after != nil or $before != nil)
		case ($ids != nil) = $limit == nil and $after == nil and $before == nil
		default = false
	}
}
