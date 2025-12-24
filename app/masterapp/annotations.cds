using BusinessService from '../../srv/material-service';

/* ============================================================
   MANUFACTURE MATERIAL – LIST REPORT + OBJECT PAGE
   ============================================================ */

annotate BusinessService.ManufactureMaterial with @UI: {

  /* ---------- FILTER BAR ---------- */
  SelectionFields: [
    materialName,
    category,
    status
  ],

  /* ---------- LIST REPORT TABLE ---------- */
  LineItem: [
    { Value: materialName, Label: 'Material Name' },
    { Value: category,     Label: 'Category' },
    { Value: status,       Label: 'Status' }
  ],

  /* ---------- OBJECT PAGE HEADER ---------- */
  HeaderInfo: {
    TypeName: 'Manufacture Material',
    TypeNamePlural: 'Manufacture Materials',
    Title:       { Value: materialName },
    Description: { Value: category }
  },

  /* ---------- OBJECT PAGE CONTENT ---------- */
  Identification: [
    { Value: materialName, Label: 'Material Name' },
    { Value: category,     Label: 'Category' },
    { Value: status,       Label: 'Status' }
  ],

  Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Material Details',
      Target : '@UI.Identification'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Raw Materials',
      Target : 'items/@UI.LineItem'
    }
  ]
};

/* ---------- REQUIRED FOR "GO" BUTTON ---------- */
annotate BusinessService.ManufactureMaterial with
@UI.SelectionPresentationVariant: {
  SelectionVariant: {
    SelectOptions: []
  },
  PresentationVariant: {
    Visualizations: ['@UI.LineItem']
  }
};

/* ============================================================
   RAW MATERIAL – ITEMS TABLE + OBJECT PAGE
   ============================================================ */

annotate BusinessService.RawMaterial with @UI: {

  /* ---------- OBJECT PAGE HEADER ---------- */
  HeaderInfo: {
    TypeName: 'Raw Material',
    TypeNamePlural: 'Raw Materials',
    Title:       { Value: material },
    Description: { Value: vendor }
  },

  /* ---------- ITEMS TABLE ---------- */
  LineItem: [
    { Value: material, Label: 'Raw Material' },
    { Value: quantity, Label: 'Quantity' },
    { Value: vendor,   Label: 'Vendor' }
  ],

  /* ---------- OBJECT PAGE CONTENT ---------- */
  Identification: [
    { Value: material, Label: 'Material Name' },
    { Value: quantity, Label: 'Quantity' },
    { Value: vendor,   Label: 'Vendor' }
  ],

  Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Raw Material Details',
      Target : '@UI.Identification'
    }
  ]
};
