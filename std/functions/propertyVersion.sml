# propertyVersion equals the version of the property of type @T
function std::propertyVersion {
	$property Selector<@T>
}

// Implementation is provided by the implementing engine
value Version

constraints {
	require @T entity
}
