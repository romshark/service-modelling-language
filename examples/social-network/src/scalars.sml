model SocialNetwork

scalar EmailAddress extends Text {
	regex /.+@.+\..+/
}

# URL represents a uniform resource locator
scalar URL extends Text {
	regex /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/
}

# PhoneNumber represents an international generic phone number
scalar PhoneNumber extends String {
	regex /\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$/
}
