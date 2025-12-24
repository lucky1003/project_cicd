sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'mm.master.masterapp',
            componentId: 'ManufactureMaterialList',
            contextPath: '/ManufactureMaterial'
        },
        CustomPageDefinitions
    );
});