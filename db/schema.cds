namespace mm;

using { cuid, managed } from '@sap/cds/common';

/**
 * Common primary key
 */
aspect PrimaryKey : cuid, managed {}

/**
 * Parent entity
 */
entity ManufactureMaterial {
  key MMID : Integer;
  materialName : String(100);
  category     : String(50);
  status       : String(20);

  items : Composition of many RawMaterial
            on items.parent = $self;
}

/**
 * Child entity
 */
entity RawMaterial{
  key materialID : String(36);
  parent   : Association to ManufactureMaterial;
  material : String(100);
  quantity : Integer;
  vendor   : String(100);
}

/**
 * Error table (PARENT)
 */
entity ErrorLog {
   key  entityID     : String(36);
  entityName   : String(50);

  errorCode    : String(20);
  errorMessage : String(255);
  severity     : String(10);

  audits : Composition of many AuditLog
             on audits.error = $self;
}

/**
 * Audit table (CHILD)
 */
entity AuditLog {
  key AuditID:Integer;
  entityName : String(50);
  entityID   : String(36);
  action     : String(10);
  oldValue   : String(500);
  newValue   : String(500);

  error : Association to ErrorLog;
}
