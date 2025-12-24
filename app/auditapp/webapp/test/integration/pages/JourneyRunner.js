sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"auditapp/test/integration/pages/AuditLogList",
	"auditapp/test/integration/pages/AuditLogObjectPage"
], function (JourneyRunner, AuditLogList, AuditLogObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('auditapp') + '/test/flp.html#app-preview',
        pages: {
			onTheAuditLogList: AuditLogList,
			onTheAuditLogObjectPage: AuditLogObjectPage
        },
        async: true
    });

    return runner;
});

