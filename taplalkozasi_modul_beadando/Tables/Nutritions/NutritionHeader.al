table 50105 "CCO Nutrition Header"
{
    Caption = 'CCO Nutrition Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
            ValidateTableRelation = true;

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get(Rec."Customer No.") then
                    Rec."Customer Name" := Customer.Name
                else
                    Rec."Customer Name" := '';
            end;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(5; "No. of Lines"; Integer)
        {
            Caption = 'No. of Lines';
            //DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = count("CCO Nutrition Line"
                                where("Nutrition No." = field("No.")));
            Editable = false;
        }
        field(6; Status; Enum "Sales Document Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        NutritionLine: Record "CCO Nutrition Line";
    begin
        NutritionLine.Reset();
        NutritionLine.SetRange("Nutrition No.", Rec."No.");
        NutritionLine.DeleteAll();
    end;
}
