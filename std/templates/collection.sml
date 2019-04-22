# collection represents a paginable collection of entities
template std::collection<@T> (
	*predicate ?(@T) => Bool
	*order     ?Order
	*orderBy   ?(Selector<@T> or Array<Selector<@T>>)
)

parameters {
	$page PageSelector<@T>
}

value -> struct {
	totalLength Uint64
	version     Version
	items       Array<@T>
} = struct {
	totalLength Uint64 = collectionLength<@T>()
	version     Version = collectionVersion<@T>()

	items Array<@T> = $page as $p {
		Array<ID<@T>> then entities<@T>(
			($t) => id($t) in $p and *predicate($t),
			*order,
			*orderBy,
			$limit
		)

		struct {
			cursor ID<@T>
			limit  Int32
		} then match {
			$p.limit > 0 then entities<@T>(
				($t) => id($t) > $p.cursor and *predicate($t),
				*order,
				*orderBy,
				$limit,
			)
			$p.limit < 0 then entities<@T>(
				($t) => id($t) < $p.cursor and *predicate($t),
				*order,
				*orderBy,
				$limit,
			)
		}

		else []
	}
}

constraints {
	require @T entity
}
