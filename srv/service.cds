using {
    opensap.MD.Addresses as Addr,
    opensap.MD.Employees as Empl,
    opensap.MD.BusinessPartners as BP,
    opensap.MD.Products as Prod,
    opensap.MD.ProductImages as ProdImages,
    opensap.MD.productCategoryVH as prodCat,
    opensap.MD.BuyerView as BuyerViewNative,
    opensap.MD.partnerRoles as partRoles,
    opensap.MD
} from '../db/schema';

service MasterDataService @(impl : '../srv/handlers/md-service.js')@(path : '/MasterDataService') {
    entity Addresses                                             as projection on Addr;
    entity Employees                                             as projection on Empl;
 //  entity User                                                  as projection on UserDetails;
    entity BusinessPartners @(title : '{i18n>businessParnters}') as projection on BP;

    entity Products @(title : '{i18n>products}')                 as projection on Prod {
        * , partner : redirected to BusinessPartners
    };

    @readonly
    view productCategoryVH as select from prodCat;

    view partnerRole as select from partRoles;
    view Buyer as select from BuyerViewNative;

    entity ProductImages                                         as projection on ProdImages {
        * , product : redirected to Products
    };

    function loadProductImages() returns Boolean;
}