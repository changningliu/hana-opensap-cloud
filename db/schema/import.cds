using {cuid} from '@sap/cds/common';

@cds.persistence.exists
entity USERDATA_USER_LOCAL : cuid {
    EMAIL     : String(255)@title : '{i18n>email}'  @assert.format : '^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    FIRSTNAME : String(40) @title : '{i18n>fname}';
    LASTNAME  : String(40) @title : '{i18n>lname}';
//  key ID: String(40) @title: '{i18n>userId}';
}

annotate USERDATA_USER_LOCAL with {
    ID @title : '{i18n>userId}' @odata.Type:'Edm.String';
};