# collectionVersion equals the version of the entity collection of type @T
function std::collectionVersion<@T>

// Implementation is provided by the implementing engine
value Version

constraints {
	require @T entity
}
