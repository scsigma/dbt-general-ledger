{{
    config(
        materialized = 'view'
    )
}}

with source as (
    select * from {{ source('snowflake', 'general_ledger_cleaned') }}
)

, renamed_recast as (
    select
        "Branch" as branch
        , "Dept" as dept
        , "Object Account" as object_account
        , gl_description
        , "GL_Date" as GL_DATE
        , "Invoice_No" as INVOICE_NO
        , "PO_No" as PO_NO
        , "Voucher_No" as VOUCHER_NO
        , "vend_cust_no" as VEND_CUST_NO
        , "vend_cust" as VEND_CUST
        , "Item_no" as ITEM_NO
        , "Remark" as REMARK
        , "Quantity" as QUANTITY
        , "Unit_of_measure" as UNIT_OF_MEASURE
        , "Amount" as AMOUNT
        , "Doc_Type" as DOC_TYPE
        , "Doc_desc" as DOC_DESC
        , "Tran_Key" as TRAN_KEY
        , "Adage_user" as ADAGE_USER
        , "Status" as STATUS
        , "Entry_No" as ENTRY_NO
    from source
)

select * from renamed_recast