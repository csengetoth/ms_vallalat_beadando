codeunit 50101 "CCO Post Nutrition Mgt."
{
    procedure PostDocument(var Nutrition: Record "CCO Nutrition Header")
    var
        PostedNutritonHeader: Record "CCO Posted Nutrition Header";
        PostedNutritonLine: Record "CCO Posted Nutrition Line";
        NutritionLine: Record "CCO Nutrition Line";

        QuestionLbl: Label 'Do you want to delete the open %1 nutrition?';
    begin
        Nutrition.TestField(Status, Nutrition.Status::Released);

        PostedNutritonHeader.Init();
        PostedNutritonHeader.TransferFields(Nutrition);
        PostedNutritonHeader."No." := 'P_' + Nutrition."No.";
        PostedNutritonHeader.Insert();

        NutritionLine.Reset();
        NutritionLine.SetRange("Nutrition No.", Nutrition."No.");
        NutritionLine.SetFilter(Quantity, '>0');
        if NutritionLine.FindSet() then
            repeat
                PostedNutritonLine.Init();
                PostedNutritonLine.TransferFields(NutritionLine);
                PostedNutritonLine."Nutrition No." := PostedNutritonHeader."No.";
                PostedNutritonLine.Insert();
            until NutritionLine.Next() = 0;

        if Confirm(QuestionLbl, true, Nutrition."No.") then
            Nutrition.Delete(true);

        Commit();
        Page.RunModal(Page::"CCO Posted Nutrition", PostedNutritonHeader);
    end;
}
