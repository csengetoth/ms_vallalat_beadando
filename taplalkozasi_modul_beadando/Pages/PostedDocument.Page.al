page 50106 "CCO Posted Document"
{

    Caption = 'CCO Posted Document';
    PageType = Document;
    SourceTable = "CCO Posted Document Header";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                    ApplicationArea = All;
                }
                field("No. of Lines"; Rec."No. of Lines")
                {
                    ToolTip = 'Specifies the value of the No. of Lines field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
            }
            part(Lines; "CCO Posted Document Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                Editable = false;
                UpdatePropagation = Both;
            }
        }
        area(FactBoxes)
        {
            part(CustomerDetail; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Customer No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ReleaseStatus)
            {
                Caption = 'Release Status';
                Image = ReleaseDoc;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.TestField("Document Date");
                    Rec.Status := enum::"Sales Document Status"::Released;
                    Rec.Modify();
                end;
            }

            action(ReopenStatus)
            {
                Caption = 'Reopen Status';
                Image = ReOpen;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.Status := enum::"Sales Document Status"::Open;
                    Rec.Modify();
                end;
            }
        }
    }
    trigger OnNewRecord(BelowRec: Boolean)
    begin
        Rec."Document Date" := Today();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Open then
            PageEditable := true
        else
            PageEditable := false;
    end;

    var
        PageEditable: Boolean;
}
