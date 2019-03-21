# Collection represents a paginable collection of entities
type std::Collection<@T>

parameters {
	$page (Array<ID<@T>> or struct {
		cursor ID<@T>
		limit  @L
	})
}

attributes {
	*predicate ?(@T) => Bool |> select { case ($ == nil) = ($x) => true }
	*order     ?Order
	*orderBy   ?(Selector<@T> or Array<Selector<@T>>)
}

value struct {
	totalLength Uint64 = collectionLength<@T>()
	version     Version = collectionVersion<@T>()

	items Array<@T> = typeof $page as $p {
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
}

constraints {
	require @T entity
	require @L integer
}