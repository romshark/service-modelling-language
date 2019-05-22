# collection represents a paginable collection of entities
template std::collection<@T> (
	$predicate ?(@T) => Bool
	$order     ?Order
	$orderBy   ?(Selector<@T> or Array<Selector<@T>>)
) = graph(
	$page PageSelector<@T>
) {
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
