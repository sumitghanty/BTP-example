namespace sap.ui.riskmanagement;
using { managed } from '@sap/cds/common';
  entity Risks : managed {
    key ID      : UUID  @(Core.Computed : true);
    title       : String(100);
    prio        : String(5);
    descr       : String;
    miti        : Association to Mitigations;
    impact      : Integer;
    criticality : Integer;
  }
  entity Mitigations : managed {
    key ID       : UUID  @(Core.Computed : true);
    description  : String;
    owner        : String;
    timeline     : String;
    risks        : Association to many Risks on risks.miti = $self;
  }
  entity Instances : managed {
    key ID      : UUID  @(Core.Computed : true);
    instanceURL       : String(100);
    clientid          : String(100);
    clientsecret      : String;
    tenant            : String(100);
    orgid             : String(100);
    spaceid           : String(100);
    apporserviceid    :String(100);
  }