# LibraryCRM defines the model of a library CRM service
model LibraryCRM {
	smlVersion: 1.0
	homepage:   github.com/qbeon/service-modelling-language
	authors:
		Roman Sharkov <roman.sharkov@qbeon.com>
		Some Person <some@company.org>
}

root books [Book]
root customers [Customer]