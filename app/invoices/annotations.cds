using InvCatalogService as service from '../../srv/cat-service';

annotate service.Invoice with @odata.draft.enabled;

annotate service.Invoice with @(UI.LineItem: {
    // #LineItemHighlight
    ![@UI.Criticality]: statusColor.criticality, // Annotation, so that the row has a criticality
    $value            : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'InvCatalogService.doThreeWayMatch',
            Label : 'Check Three Way Match'
        },
        {
            $Type: 'UI.DataField',
            Label: 'Document ID',
            Value: documentId,

        },
        {
            $Type: 'UI.DataField',
            Label: 'Fiscal Year',
            Value: fiscalYear,

        },
        {
            $Type: 'UI.DataField',
            Label: 'Company Code',
            Value: companyCode,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Document Date',
            Value: documentDate,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Posting Date',
            Value: postingDate,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Supplier Invoice Party',
            Value: supInvParty,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Document Currency',
            Value: documentCurrency,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Invoice Gross Amount',
            Value: invGrossAmount,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Status Text',
            Value: status,
        // Criticality              : statusColor.criticality, //Supported values 0,1,2,3,5
        //CriticalityRepresentation: #WithIcon,
        },
        {
            $Type                    : 'UI.DataField',
            Label                    : 'Status',
            Value                    : statusFlag,
            Criticality              : statusColor.criticality, //Supported values 0,1,2,3,5
            CriticalityRepresentation: #WithIcon,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Invoice Number',
            Value: newInvoice,
        },
    ]
},

);

annotate service.Invoice with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Fiscal Year',
                Value: fiscalYear,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Company Code',
                Value: companyCode,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Document Date',
                Value: documentDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Posting Date',
                Value: postingDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Supplier Invoice Party',
                Value: supInvParty,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Document Currency',
                Value: documentCurrency,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Invoice Gross Amount',
                Value: invGrossAmount,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Status',
                Value: status,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Status Flag',
                Value: statusFlag,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Invoice Number',
                Value: newInvoice,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Comments',
                Value: comments,
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Invoice Items',
            ID    : 'InvoiceItems',
            Target: 'to_InvoiceItem/@UI.LineItem#InvoiceItems',
        },
    ],
);

annotate service.Invoice with @(UI.SelectionFields: [
    fiscalYear,
    companyCode,
    documentDate,
    postingDate,
    supInvParty,
    documentCurrency,
    invGrossAmount,
    status,
    newInvoice,
    comments,
]);

annotate service.Invoice with {
    fiscalYear       @Common.Label: 'Fiscal Year';
    companyCode      @Common.Label: 'Company Code';
    documentDate     @Common.Label: 'Document Date';
    postingDate      @Common.Label: 'Posting Date';
    supInvParty      @Common.Label: 'Supplier Invoice Party';
    documentCurrency @Common.Label: 'Document Currency';
    invGrossAmount   @Common.Label: 'Invoice Gross Amount';
    status           @Common.Label: 'Status';
    newInvoice       @Common.Label: 'Invoice Number';
    comments         @Common.Label: 'Comments';
};

annotate service.InvoiceItem with @(UI.LineItem #InvoiceItems: [
    {
        $Type: 'UI.DataField',
        Value: supplierInvoice,
        Label: 'Supplier Invoice',
    },
    {
        $Type: 'UI.DataField',
        Value: fiscalYear,
        Label: 'Fiscal Year',
    },
    {
        $Type: 'UI.DataField',
        Value: sup_InvoiceItem,
        Label: 'Supplier Invoice Item',
    },
    {
        $Type: 'UI.DataField',
        Value: purchaseOrder,
        Label: 'Purchase Order',
    },
    {
        $Type: 'UI.DataField',
        Value: purchaseOrderItem,
        Label: 'Purchase Order Item',
    },
    {
        $Type: 'UI.DataField',
        Value: referenceDocument,
        Label: 'Reference Document',
    },
    {
        $Type: 'UI.DataField',
        Value: refDocFiscalYear,
        Label: 'Reference Document Fiscal Year',
    },
    {
        $Type: 'UI.DataField',
        Value: refDocItem,
        Label: 'Reference Document Item',
    },
    {
        $Type: 'UI.DataField',
        Value: taxCode,
        Label: 'Tax Code',
    },
    {
        $Type: 'UI.DataField',
        Value: documentCurrency,
        Label: 'Document Currency',
    },
    {
        $Type: 'UI.DataField',
        Value: supInvItemAmount,
        Label: 'Supplier Invoice Item Amount',
    },
    {
        $Type: 'UI.DataField',
        Value: poQuantityUnit,
        Label: 'PO Quantity Unit',
    },
    {
        $Type: 'UI.DataField',
        Value: quantityPOUnit,
        Label: 'Quantity in PO Unit',
    },
]);

annotate service.InvoiceItem with @(
    UI.Facets                 : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Item Details',
        ID    : 'ItemDetails',
        Target: '@UI.FieldGroup#ItemDetails',
    }, ],
    UI.FieldGroup #ItemDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: supplierInvoice,
                Label: 'Supplier Invoice',
            },
            {
                $Type: 'UI.DataField',
                Value: fiscalYear,
                Label: 'Fiscal Year',
            },
            {
                $Type: 'UI.DataField',
                Value: sup_InvoiceItem,
                Label: 'Supplier Invoice Item',
            },
            {
                $Type: 'UI.DataField',
                Value: purchaseOrder,
                Label: 'Purchase Order',
            },
            {
                $Type: 'UI.DataField',
                Value: purchaseOrderItem,
                Label: 'Purchase Order Item',
            },
            {
                $Type: 'UI.DataField',
                Value: referenceDocument,
                Label: 'Reference Document',
            },
            {
                $Type: 'UI.DataField',
                Value: refDocFiscalYear,
                Label: 'Reference Document Fiscal Year',
            },
            {
                $Type: 'UI.DataField',
                Value: refDocItem,
                Label: 'Reference Document Item',
            },
            {
                $Type: 'UI.DataField',
                Value: taxCode,
                Label: 'Tax Code',
            },
            {
                $Type: 'UI.DataField',
                Value: documentCurrency,
                Label: 'Document Currency',
            },
            {
                $Type: 'UI.DataField',
                Value: supInvItemAmount,
                Label: 'Supplier Invoice Item Amount',
            },
            {
                $Type: 'UI.DataField',
                Value: poQuantityUnit,
                Label: 'PO Quantity Unit',
            },
            {
                $Type: 'UI.DataField',
                Value: quantityPOUnit,
                Label: 'Quantity in PO Unit',
            },
        ],
    }
);

annotate service.Invoice with @(UI.HeaderInfo: {
    TypeName      : 'Invoice',
    TypeNamePlural: 'Invoices',
    Title         : {
        $Type: 'UI.DataField',
        Value: supInvParty,
    //Criticality              : statusColor.criticality,
    //CriticalityRepresentation: #WithIcon,
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: fiscalYear,
    //Criticality              : statusColor.criticality,
    // CriticalityRepresentation: #WithIcon,
    },
});

annotate service.Invoice with @(UI.HeaderFacets: [{
    $Type : 'UI.CollectionFacet',
    ID    : 'productHeaderFacetId',
    Label : 'Admin Data',
    Facets: [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#AdminData',
        ID    : 'AdminDataID',
        Label : 'Admin Data',
    }]
}, ]);

annotate service.Invoice @(UI.FieldGroup #AdminData: {Data: [
    {Value: createdAt,
        Label : '{i18n>CreatedAt}',},
    {Value: createdBy,
        Label : '{i18n>CreatedBy}',},
    {Value: modifiedAt},
    {Value: modifiedBy}
]}, );

annotate service.InvoiceItem with @(UI.HeaderInfo: {
    TypeName      : 'Invoice Item',
    TypeNamePlural: 'Invoice Items',
    Title         : {
        $Type: 'UI.DataField',
        Value: sup_InvoiceItem,
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: documentCurrency,
    },
});

annotate service.InvoiceItem with @(UI.HeaderFacets: [{
    $Type : 'UI.CollectionFacet',
    ID    : 'productHeaderFacetId',
    Label : 'Admin Data',
    Facets: [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#AdminData',
        ID    : 'AdminDataID',
        Label : 'Admin Data',
    }]
}, ]);

annotate service.InvoiceItem @(UI.FieldGroup #AdminData: {Data: [
    {Value: createdAt},
    {Value: createdBy},
    {Value: modifiedAt},
    {Value: modifiedBy}
]}, );

//annotate service.Invoice @(Common: {SideEffects #statusChanged: {
//  SourceProperties: [status],
// TargetProperties: ['']
//}});

annotate service.Invoice with @(UI.PresentationVariant: {
    // /RequestAtLeast     : [
    //     'ID',
    //     'pr_enabled',
    //     'pdr_enabled'
    // ],
    SortOrder: [ //Default sort order
    {
        Property  : documentId,
        Descending: true
    }, ],
    ID       : 'InvoicePresentationDefault',
    Text     : '{Invoice}',
    MaxItems : 30,
// SelectionFields: [ID],
// Visualizations     : ['@UI.LineItem#Simplified'],
// ![@Common.Messages]: [

//],
});

annotate service.Invoice @(Common.SemanticKey: [
    ID,
    documentId

]);

annotate service.Invoice with @(
    UI.SelectionVariant #SelectionVariantAll    : {
        Text         : 'All Invoices',
        ID           : 'SelectionVariantAllID',
        SelectOptions: [{PropertyName: statusFlag}]
    },
    UI.SelectionVariant #SelectionVariantActive : {
        ID           : 'SelectionVariantActiveID',
        Text         : 'Matched Invoices',
        SelectOptions: [ 
        {
            PropertyName: status,
            Ranges      : [{
                Sign  : #I,
                Option: #EQ,
                Low   : 'S',
            }, ],
        }, ],
    },
    UI.SelectionVariant #SelectionVariantExpired: {
        ID           : 'SelectionVariantExpiredID',
        Text         : 'Erroneous Invoices',
        SelectOptions: [{
            PropertyName: statusFlag,
            Ranges      : [{
                Sign  : #I,
                Option: #EQ,
                Low   : 'E',
            }, ],
        }, ],
    },
);
annotate service.Invoice with {
    statusFlag  @title: 'Status'  @Common.Text: statusColor.value  @Common.TextArrangement: #TextOnly;
};

annotate service.StatusValues with {
    code  @title: '{i18n>status}'  @Common.Text: value  @Common.TextArrangement: #TextOnly
};
