tableextension 50202 "Code" extends "Purchase Line"
{
    fields
    {
        field(19; "ITS Code"; Code[100])
        {
            Caption = 'ITS Code';
            TableRelation = ItemVariant.Code where("Vendor No." = Field("Buy-from Vendor No."));

        }
    }



    var
        myInt: Integer;
        itscode: Record ItemVariant;
        Rekord: Record "Item Variant";

}