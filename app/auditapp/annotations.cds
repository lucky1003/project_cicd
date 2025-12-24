using MonitoringService from '../../srv/material-service';

annotate MonitoringService.AuditLog with @UI: {

  LineItem: [
    { Value: action,    Label: 'Action' },
    { Value: oldValue,  Label: 'Old Value' },
    { Value: newValue,  Label: 'New Value' }
  ],

  Identification: [
    { Value: action },
    { Value: oldValue },
    { Value: newValue }
  ]
};
