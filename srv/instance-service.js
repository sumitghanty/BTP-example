const cds = require('@sap/cds')
/**
 * Implementation for Risk Management service defined in ./risk-service.cds
 */




module.exports = cds.service.impl(async function () {
    let that = this;
    this.after('READ', 'Instances', instanceData => {
        const instances = Array.isArray(instanceData) ? instanceData : [instanceData];
        instances.forEach(instance => {
            if (instance.instanceURL.indexOf('mioamore') != 1) {
                var data = async function getAuditLog(instance) {
                    try {
                        let options1 = {
                            method: 'POST',
                            url: instance.instanceURL + '/oauth/token?grant_type=client_credentials',
                            headers: {
                                Authorization: 'Basic ' + Buffer.from(instance.clientid + ':' + instance.clientsecret).toString('base64')
                            }
                        };
                        let res1 = await axios(options1);
                        let timeFrom = new Date(Date.now() - (1000 * 60 * 5)); // 5 minutes ago
                        try {
                            options2 = {
                                method: 'GET',
                                url: instance.instanceURL + '/auditlog/v2/auditlogrecords?time_from=' + timeFrom.toISOString().substring(0, 16),
                                headers: {
                                    Authorization: 'Bearer ' + res1.data.access_token
                                }
                            };
                            let res2 = await axios(options2);
                            log.info("Message"+data[0].message)
                            instance.orgid = data[0].message;
                            return res2.data;
                        } catch (err) {
                            console.log(err.stack);
                            return err.message;
                        }
                    } catch (err) {
                        console.log(err.stack);
                        return err.message;
                    }
                };
                
            } else {
                instance.orgid = 'SAP';
            }
        });
    });
});