%dw 2.0
output application/java
---
(p('physicalInventory.errorReport.date') default "") ++ ((now() >> p('api.timeZone')) as String {format:"dd-MMM-yyyy"}) ++ (p('physicalInventory.errorReport.title') default "") ++ (p('physicalInventory.errorReport.time') default "") ++ ((now() >> p('api.timeZone')) as String {format: "hh:mm:ss"})
++ (p('physicalInventory.errorReport.reportName') default "")
++ (p('physicalInventory.errorReport.processId') default "") ++ ((now() >> p('api.timeZone')) as String {format: "yyyy-MM-dd-hh-mm-ss-SSS"})
++ (p('physicalInventory.errorReport.errorCount') default "") ++ (payload.errorCount default "0")
++ (p('physicalInventory.errorReport.columns') default "")
++ (p('physicalInventory.errorReport.separator') default "") 
++ ((((zip((payload.results.measurementPosition default []),(payload.results.message default [])) default []) map() -> 
	{ 
		"message": $ joinBy ("\t\t\t\t\t")
	}
).message default [p('physicalInventory.errorReport.defaultReportMessage')]) joinBy ("\n"))

