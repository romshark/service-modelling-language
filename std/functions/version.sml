# version equals the version $subject where $subject is either an entity
# instance or a property of an entity instance
function std::version

parameters {
	$subject (Type<@T> or Selector<@T>)
}

// Implementation is provided by the implementing engine
value Version

constraints {
	require @T entity
}
