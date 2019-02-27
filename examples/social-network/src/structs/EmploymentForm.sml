struct SocialNetwork::EmploymentForm

use {
	"std" 1.0
}

properties {
	organization ID<Organization>
	begin        Time
	end          ?Time
	position     ?Text
}
