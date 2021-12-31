codeunit 50103 "CCO Sales Order Mgt."
{
    procedure CreateMessageBeforeRelease(var Rec: Record "Sales Header")
    begin
        Message('OnBefore Action Event');
    end;

    var
        Label1Lbl: Label 'Test Report';
}
