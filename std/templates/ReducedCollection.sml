# ReducedCollection represents a paginable collection of entity instances
# reduced to a specific type
template std::ReducedCollection<@E, @T> {
	*predicate ?(@E) => Bool
	*reducer   (@E) => @T
	*order     ?Order
	*orderBy   ?(Selector<@E> or Array<Selector<@E>>)
}

parameters {
	$page (Array<ID<@T>> or struct {
		cursor ID<@T>
		limit  @L
	})
}

value struct {
	totalLength Uint64 = collectionLength<@T>()
	version     Version = collectionVersion<@T>()

	items Array<@T> = {
		$found = $page as $p {
			Array<ID<@T>> = fetch<@T>(
				($t) => $t:id in $p and *predicate($t),
				*order,
				*orderBy,
				$limit
			)
			struct {
				cursor ID<@T>
				limit  Int32
			} = match {
				$p.limit > 0 = fetch<@T>(
					($t) => $t:id > $p.cursor and *predicate($t),
					*order,
					*orderBy,
					$limit,
				)
				$p.limit < 0 = fetch<@T>(
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
