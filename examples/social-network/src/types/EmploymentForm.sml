type SocialNetwork::EmploymentForm

use {
	"std" 1.0
}

value struct {
	organization Organization
	begin        Time
	end          ?Time
	position     ?Text
}
