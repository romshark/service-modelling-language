# RegExp represents a regular expression
type std::RegExp

attributes {
	*global          ?Bool
	*caseInsensitive ?Bool |> select {
		case ($ == nil) = false
	}
	*multiline ?Bool
}

// Implementation is provided by the implementing engine
value RegExp
