# ReducedCollection represents a paginable collection of entity instances
# reduced to a specific type
type std::ReducedCollection<@E, @T>

parameters {
	$ids    ?Array<ID<@E>>
	$after  ?ID<@E>
	$before ?ID<@E>
	$limit  ?Int32
}

attributes {
	*predicate ?(@E) => Bool |> select { case ($ == nil) = ($x) => true }
	*reducer   (@E) => @T
	*order     ?Order
	*orderBy   ?(Selector<@E> or Array<Selector<@E>>)
}

value Array<@T> = {
	$found = select {
		case ($ids != nil) = fetch<@E>(
			($t) => $t:id in $ids and *predicate($t),
			*order,
			*orderBy,
			$limit
		)
		case ($after != nil) = fetch<@E>(
			($t) => $t:id > $after and *predicate($t),
			*order,
			*orderBy,
			$limit
		)
		case ($before != nil) = fetch<@E>(
			($t) => $t:id < $before and *predicate($t),
			*order,
			*orderBy,
			negate($limit)
		)
		default = @T[]
	}
	& = map($found, ($e) => *reducer($e))
}

hiddenProperties {
	lenght  Size = count(Type<@E>)
	version Version = collectionVersion(Type<@E>)
}

constraints {
	require @E entity

	require ($ids, $limit, $after, $before) => select {
		case ($ids == nil) = $limit != nil and ($after != nil or $before != nil)
		case ($ids != nil) = $limit == nil and $after == nil and $before == nil
		default = false
	}
}
