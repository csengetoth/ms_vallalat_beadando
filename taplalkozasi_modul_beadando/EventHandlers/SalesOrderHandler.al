codeunit 50102 "CCO Sales Order-Handler"
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'Release', false, false)]
    local procedure OnBeforeActionEvent_Release(var Rec: Record "Sales Header")
    var
        SalesOrderMgt: Codeunit "CCO Sales Order Mgt.";
    begin
        SalesOrderMgt.CreateMessageBeforeRelease(Rec);
    end;
}
