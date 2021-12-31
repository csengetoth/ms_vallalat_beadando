report 50100 "CCO Training Test"
{
    ApplicationArea = All;
    Caption = 'CCO Training Test';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.\src\Reports\trainingTest.rdlc';
    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = where("Block Payment Tolerance" = const(false));
            column(Name; Name)
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(City; City)
            {
                IncludeCaption = true;
            }
            column(Address; Address)
            {
            }
            column(Balance; Balance)
            {
            }
            column(NoofOrders; "No. of Orders")
            {
            }
            column(PaymentMethodCode; "Payment Method Code")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
