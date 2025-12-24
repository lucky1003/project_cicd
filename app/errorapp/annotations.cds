using MonitoringService from '../../srv/material-service';

annotate MonitoringService.ErrorLog with @UI: {

  LineItem: [
    { Value: errorCode,    Label: 'Error Code' },
    { Value: errorMessage,Label: 'Message' },
    { Value: severity,     Label: 'Severity' },
    { Value: entityName,   Label: 'Entity' }
  ],

  Identification: [
    { Value: errorCode },
    { Value: errorMessage },
    { Value: severity }
  ],

  Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Error Details',
      Target : '@UI.Identification'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Audit History',
      Target : 'audits/@UI.LineItem'
    }
  ]
};
