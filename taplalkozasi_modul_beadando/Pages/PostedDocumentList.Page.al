page 50107 "CCO Posted Document List"
{

    ApplicationArea = All;
    Caption = 'CCO Posted Document List';
    PageType = List;
    SourceTable = "CCO Posted Document Header";
    UsageCategory = Lists;
    CardPageId = "CCO Posted Document";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = Rec.Status::Released;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = Rec.Status::Released;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = Rec.Status::Released;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = Rec.Status = Rec.Status::Released;
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
        }
    }

}
