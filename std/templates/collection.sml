# collection represents a paginable collection of entities
template std::collection<@T> (
	$predicate ?(@T) => Bool
	$order     ?Order
	$orderBy   ?(Selector<@T> or Array<Selector<@T>>)
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
	items       Array<@T> = resolvedPage<@T>(
		$page,
		$predicate,
		$order,
		$orderBy,
	)
}

constraints {
	require @T entity
}
