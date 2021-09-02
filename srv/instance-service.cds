using {sap.ui.riskmanagement as my} from '../db/schema';

@path : 'service/instance'
service InstanceService {    
    entity Instances   as projection on my.Instances;
    annotate Instances with @odata.draft.enabled;
}
