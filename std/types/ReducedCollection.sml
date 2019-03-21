# ReducedCollection represents a paginable collection of entity instances
# reduced to a specific type
type std::ReducedCollection<@E, @T>

parameters {
	$page (Array<ID<@T>> or struct {
		cursor ID<@T>
		limit  @L
	})
}

attributes {
	*predicate ?(@E) => Bool |> select { case ($ == nil) = ($x) => true }
	*reducer   (@E) => @T
	*order     ?Order
	*orderBy   ?(Selector<@E> or Array<Selector<@E>>)
}

value struct {
	totalLength Uint64 = collectionLength<@T>()
	version     Version = collectionVersion<@T>()

	items Array<@T> = {
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
}

constraints {
	require @E entity
	require @L integer
}
