sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"mm/master/masterapp/test/integration/pages/ManufactureMaterialList",
	"mm/master/masterapp/test/integration/pages/ManufactureMaterialObjectPage",
	"mm/master/masterapp/test/integration/pages/RawMaterialObjectPage"
], function (JourneyRunner, ManufactureMaterialList, ManufactureMaterialObjectPage, RawMaterialObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('mm/master/masterapp') + '/test/flp.html#app-preview',
        pages: {
			onTheManufactureMaterialList: ManufactureMaterialList,
			onTheManufactureMaterialObjectPage: ManufactureMaterialObjectPage,
			onTheRawMaterialObjectPage: RawMaterialObjectPage
        },
        async: true
    });

    return runner;
});

