# entityById equals an optional entity instance which is identified by $id.
# It equals nil if no entity instance is identified by $id
function std::entityById ($id ID<@T>) -> ?@T =
	entity<@T>(filter: ($x) => $x:id == $id)

constraints {
	require @T entity
}
