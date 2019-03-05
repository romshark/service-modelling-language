# Collection represents a paginable collection of entities
type std::Collection<@T>

parameters {
	$page (Array<ID<@T>> or struct {
		cursor ID<@T>
		limit  Int32
	})
}

constParameters {
	*predicate ?(@T) => Bool |> select { case ($ == nil) = ($x) => true }
	*order     ?Order
	*orderBy   ?(Selector<@T> or Array<Selector<@T>>)
}

value Array<@T> = typeof $page as $p {
	case Array<ID<@T>> = fetch<@T>(
		($t) => $t:id in $p and *predicate($t),
		*order,
		*orderBy,
		$limit
	)
	case struct {
		cursor ID<@T>
		limit  Int32
	} = select {
		case ($p.limit > 0) = fetch<@T>(
			($t) => $t:id > $p.cursor and *predicate($t),
			*order,
			*orderBy,
			$limit,
		)
		case ($p.limit < 0) = fetch<@T>(
			($t) => $t:id < $p.cursor and *predicate($t),
			*order,
			*orderBy,
			$limit,
		)
	}
	default = []
}

attributes {
	lenght  Size = count(Type<@T>)
	version Version = collectionVersion(Type<@T>)
}

constraints {
	require @T entity

	require ($ids, $limit, $after, $before) => select {
		case ($ids == nil) = $limit != nil and ($after != nil or $before != nil)
		case ($ids != nil) = $limit == nil and $after == nil and $before == nil
		default = false
	}
}
