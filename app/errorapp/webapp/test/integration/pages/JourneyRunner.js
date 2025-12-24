sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"errorapp/test/integration/pages/ErrorLogList",
	"errorapp/test/integration/pages/ErrorLogObjectPage"
], function (JourneyRunner, ErrorLogList, ErrorLogObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('errorapp') + '/test/flp.html#app-preview',
        pages: {
			onTheErrorLogList: ErrorLogList,
			onTheErrorLogObjectPage: ErrorLogObjectPage
        },
        async: true
    });

    return runner;
});

