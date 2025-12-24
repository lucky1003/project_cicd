using mm from '../db/schema';

service BusinessService @(require:'authenticated-user'){

  @odata.draft.enabled
  @restrict:[{grant:'*',to:'Admin'}
  ,{grant:'READ',to:'Viewer'}
  ]
  entity ManufactureMaterial
    as projection on mm.ManufactureMaterial;

  entity RawMaterial
    as projection on mm.RawMaterial;
}

service MonitoringService {

  @readonly
  entity ErrorLog as projection on mm.ErrorLog;

  @readonly
  entity AuditLog as projection on mm.AuditLog;
}
