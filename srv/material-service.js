const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

  const { ManufactureMaterial, AuditLog, ErrorLog } = cds.entities('mm');

  // ------------------------------------
  // BEFORE CREATE - VALIDATION
  // ------------------------------------
  this.before('CREATE', 'ManufactureMaterial', async (req) => {

    if (!req.data.materialName) {

      await INSERT.into(ErrorLog).entries({
        entityName: 'ManufactureMaterial',
        errorCode: 'MANDATORY',
        errorMessage: 'Material Name is mandatory',
        severity: 'HIGH'
      });

      req.reject(400, 'Material Name is mandatory');
    }
  });

  // ------------------------------------
  // AFTER CREATE - AUDIT
  // ------------------------------------
  this.after('CREATE', 'ManufactureMaterial', async (data) => {

    await INSERT.into(AuditLog).entries({
      entityName: 'ManufactureMaterial',
      entityID: data.ID,
      action: 'CREATE',
      newValue: JSON.stringify(data)
    });
  });

  // ------------------------------------
  // AFTER UPDATE - AUDIT
  // ------------------------------------
  this.after('UPDATE', 'ManufactureMaterial', async (data) => {

    await INSERT.into(AuditLog).entries({
      entityName: 'ManufactureMaterial',
      entityID: data.ID,
      action: 'UPDATE',
      newValue: JSON.stringify(data)
    });
  });

  // ------------------------------------
  // AFTER DELETE - AUDIT
  // ------------------------------------
  this.after('DELETE', 'ManufactureMaterial', async (data) => {

    await INSERT.into(AuditLog).entries({
      entityName: 'ManufactureMaterial',
      entityID: data.ID,
      action: 'DELETE'
    });
  });

});

