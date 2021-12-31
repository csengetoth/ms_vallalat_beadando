page 50103 "CCO Nutrition"
{

    Caption = 'CCO Nutrition';
    PageType = Document;
    SourceTable = "CCO Nutrition Header";

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
                    Editable = PageEditable;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
                field("No. of Lines"; Rec."No. of Lines")
                {
                    ToolTip = 'Specifies the value of the No. of Lines field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                    Editable = PageEditable;
                }
            }
            part(Lines; "CCO Nutrition Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Nutrition No." = field("No.");
                Editable = PageEditable;
                UpdatePropagation = Both;
            }
        }
        area(FactBoxes)
        {
            part(CustomerDetail; "Customer Details Factbox")
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
                    Rec.Status := enum::"Sales Document Status"::Released;
                    Rec.Modify();
                    Rec.TestField(Date);
                end;

            }
            action(ReopenStatus)
            {
                Caption = 'ReopenStatus';
                Image = ReOpen;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.Status := enum::"Sales Document Status"::Open;
                    Rec.Modify();
                end;

            }
            action(PostNutriton)
            {
                Caption = 'Post';
                Image = Post;
                ApplicationArea = All;
                trigger OnAction()
                var
                    PostNutritionMgt: Codeunit "CCO Post Nutrition Mgt.";
                begin
                    PostNutritionMgt.PostDocument(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowRec: Boolean)
    begin
        Rec."Date" := Today();
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
