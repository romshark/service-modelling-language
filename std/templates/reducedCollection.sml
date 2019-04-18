# reducedCollection represents a paginable collection of entity instances
# reduced to a specific type
template std::reducedCollection<@E, @T> (
	*predicate ?(@E) => Bool
	*order     ?Order
	*orderBy   ?(Selector<@E> or Array<Selector<@E>>)
	*reducer   (@E) => @T
)

parameters {
	$page (Array<ID<@E>> or struct {
		cursor ID<@E>
		limit  integer
	})
}

value -> struct {
	totalLength Uint64
	version     Version
	items       Array<@T>
} = struct {
	totalLength Uint64 = collectionLength<@E>()
	version     Version = collectionVersion<@E>()

	items Array<@T> = {
		& = map($found, ($e) => *reducer($e))

		$found = $page as $p {
			Array<ID<@T>> then fetch<@E>(
				($t) => id($t) in $p and *predicate($t),
				*order,
				*orderBy,
				$limit
			)

			struct {
				cursor ID<@T>
				limit  Int32
			} then match {
				$p.limit > 0 then fetch<@T>(
					($t) => id($t) > $p.cursor and *predicate($t),
					*order,
					*orderBy,
					$limit,
				)
				$p.limit < 0 then fetch<@T>(
					($t) => id($t) < $p.cursor and *predicate($t),
					*order,
					*orderBy,
					$limit,
				)
			}

			else []
		}
	}
}

constraints {
	require @E entity
}
