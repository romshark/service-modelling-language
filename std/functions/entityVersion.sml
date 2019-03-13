# entityVersion equals the version of the entity of type @T
function std::entityVersion<@T>

// Implementation is provided by the implementing engine
value Version

constraints {
	require @T entity
}
