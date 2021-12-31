codeunit 50100 "CCO Post Document Mgt."
{
    procedure PostDocument(var Document: Record "CCO Document Header")
    var
        PostedDocumentHeader: Record "CCO Posted Document Header";
        PostedDocumentLine: Record "CCO Posted Document Line";
        DocumentLine: Record "CCO Document Line";
        Questionbl: label 'Do you want to delete the open %1 document?';
    begin
        Document.TestField(Status, Document.Status::Released);

        PostedDocumentHeader.Init();
        PostedDocumentHeader.TransferFields(Document);
        PostedDocumentHeader."No." := 'P_' + Document."No.";
        PostedDocumentHeader.Insert();

        DocumentLine.Reset();
        DocumentLine.SetRange("Document No.", Document."No.");
        DocumentLine.SetFilter(Quantity, '>0');
        if DocumentLine.FindSet() then
            repeat
                PostedDocumentLine.Init();
                PostedDocumentLine.TransferFields(DocumentLine);
                PostedDocumentLine."Document No." := PostedDocumentHeader."No.";
                PostedDocumentLine.Insert();
            until DocumentLine.Next() = 0;

        if Confirm(Questionbl, true, Document."No.") then
            Document.Delete(true);

        Commit();
        Page.RunModal(Page::"CCO Posted Document", PostedDocumentHeader);
    end;
}
