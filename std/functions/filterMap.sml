# filterMap equals a transformed version $array.
# The $transformation function is applied to each element of $array and if it
# doesn't equal nil then the value is included
function std::filterMap {
	$array          Array<@A>
	$transformation (@A) => ?@B
}

// Implementation is provided by the implementing engine
value Array<@B>
