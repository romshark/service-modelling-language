# ID represents a universally unique identifier
# of an entity of an arbitrary type
type std::ID<@T>

// Implementation is provided by the implementing engine
value ID<@T>

constraints {
	require @T entity
}
