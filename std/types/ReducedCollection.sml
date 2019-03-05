# ReducedCollection represents a paginable collection of entity instances
# reduced to a specific type
type std::ReducedCollection<@E, @T>

parameters {
	$page (Array<ID<@T>> or struct {
		cursor ID<@T>
		limit  Int32
	})
}

attributes {
	*predicate ?(@E) => Bool |> select { case ($ == nil) = ($x) => true }
	*reducer   (@E) => @T
	*order     ?Order
	*orderBy   ?(Selector<@E> or Array<Selector<@E>>)
}

value Array<@T> = {
	$found = typeof $page as $p {
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
