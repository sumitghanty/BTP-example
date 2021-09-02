using InstanceService from './instance-service';

annotate InstanceService.Instances with {
    instanceURL    @title : 'InstanceURL';
    clientid       @title : 'Client Id';
    clientsecret   @title : 'Client Secret';
    tenant         @title : 'Tenant';
    orgid          @title : 'Org Id';
    spaceid        @title : 'Space Id';
    apporserviceid @title : 'Apporservice Id';
}

annotate InstanceService.Instances with @(UI : {
    HeaderInfo       : {
        TypeName       : 'Instance',
        TypeNamePlural : 'Instances',
        Title          : {
            $Type : 'UI.DataField',
            Value : instanceURL
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : clientid
        }
    },
    SelectionFields  : [instanceURL],
    LineItem         : [
        {Value : instanceURL},
        {Value : clientid},
        {Value : clientsecret}


    ],
    Facets           : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Main',
        Target : '@UI.FieldGroup#Main'
    }],
    FieldGroup #Main : {Data : [
        {Value : instanceURL},
        {Value : clientid},
        {Value : clientsecret},
        {Value : tenant},
        {Value : orgid},
        {Value : spaceid},
        {Value : apporserviceid}
    ]}
}, ) {

};
