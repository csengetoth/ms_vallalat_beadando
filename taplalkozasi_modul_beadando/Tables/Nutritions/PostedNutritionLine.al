table 50110 "CCO Posted Nutrition Line"
{
    Caption = 'CCO Posted Nutrition Line';
    DataClassification = ToBeClassified;
    LookupPageId = "CCO Nutrition Subpage";
    DrillDownPageId = "CCO Nutrition Subpage";

    fields
    {
        field(1; "Nutrition No."; Code[20])
        {
            Caption = 'Nutrition No.';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
            trigger OnValidate()
            var
                Item: Record Item;
            begin
                Rec.CalcFields(Description);
                Rec.Quantity := 1;
                Item.Get(Rec."Item No.");
                Rec."Unit of Measure Code" := Item."Base Unit of Measure";
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            //DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description
                                where("No." = field("Item No.")));
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(6; Protein; Integer)
        {
            Caption = 'Protein';
            DataClassification = CustomerContent;
        }
        field(7; Fat; Integer)
        {
            Caption = 'Fat';
            DataClassification = CustomerContent;
        }
        field(8; Carbohydrate; Integer)
        {
            Caption = 'Carbohydrate';
            DataClassification = CustomerContent;
        }
        field(9; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;
            TableRelation = "Item Unit of Measure"
                            where("Item No." = field("Item No."));
        }
        field(10; KJ; Integer)
        {
            Caption = 'KJ';
            DataClassification = CustomerContent;
        }
        field(11; Kcal; Integer)
        {
            Caption = 'Kcal';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Nutrition No.", "Line No.")
        {
            Clustered = true;
        }
    }

}
